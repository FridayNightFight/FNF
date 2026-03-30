#!/usr/bin/env python
"""
fnf_transform.py — FNF Arma 3 composition.sqe transformer.

Usage:
    python fnf_transform.py <input.sqe> [output.sqe]
    python fnf_transform.py --all <kits_dir>
"""

import sys
import os
import re
import shutil
import argparse

# ---------------------------------------------------------------------------
# LOW-LEVEL HELPERS
# ---------------------------------------------------------------------------

def find_block_end(text, start):
    """
    Given the index of the opening '{' in text, return the index of the
    matching closing '}'.  Returns -1 if not found.
    """
    depth = 0
    i = start
    while i < len(text):
        c = text[i]
        if c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                return i
        i += 1
    return -1


def find_block_for_anchor(text, anchor, search_start=0):
    """
    Find the *enclosing* class block that contains *anchor*.
    Returns (block_start_char_of_class_keyword, block_end_incl_semicolon)
    where we search back from the anchor position for the most recent
    'class ItemN' opening.
    """
    anchor_idx = text.find(anchor, search_start)
    if anchor_idx == -1:
        return None, None
    return anchor_idx, None


def extract_block(text, class_keyword_pos):
    """
    Starting at the position of 'class ItemN', extract the full block up to
    and including the trailing '};'.
    Returns (full_text_of_block, end_pos_exclusive).
    """
    brace_start = text.index('{', class_keyword_pos)
    brace_end = find_block_end(text, brace_start)
    if brace_end == -1:
        raise ValueError("Unmatched braces")
    # include trailing ';' if present
    after = brace_end + 1
    if after < len(text) and text[after] == ';':
        after += 1
    return text[class_keyword_pos:after], after


def find_enclosing_group_block(text, anchor, units_entities_start, units_entities_end):
    """
    Find the top-level group 'class ItemN' block (at exactly depth-1 inside
    the Units Entities block) that contains *anchor*.
    Returns (block_text, start_in_text, end_exclusive_in_text).
    """
    anchor_idx = text.find(anchor)
    if anchor_idx == -1 or not (units_entities_start < anchor_idx < units_entities_end):
        return None, -1, -1

    # Walk the Units Entities block to find top-level items
    depth = 0
    i = units_entities_start  # this is the '{' of the Entities block
    current_item_start = -1

    while i <= units_entities_end:
        c = text[i]
        if c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                break

        # At depth 1, look for class ItemN
        if depth == 1:
            m = re.match(r'class Item\d+\s*\n\s*\{', text[i:i+40])
            if m:
                current_item_start = i
        i += 1

        # Check if anchor is inside this item
        if current_item_start != -1 and i > anchor_idx:
            # Find block end of current_item_start
            brace_s = text.index('{', current_item_start)
            brace_e = find_block_end(text, brace_s)
            if brace_e != -1 and brace_e >= anchor_idx:
                end_excl = brace_e + 1
                if end_excl < len(text) and text[end_excl] == ';':
                    end_excl += 1
                return text[current_item_start:end_excl], current_item_start, end_excl
            current_item_start = -1

    return None, -1, -1


def get_units_entities_bounds(text):
    """
    Return (open_brace_pos, close_brace_pos) for the Units layer Entities block.
    open_brace_pos is the '{' that opens the Entities block.
    """
    units_name_idx = text.find('name="Units";')
    if units_name_idx == -1:
        raise ValueError('Units layer not found')
    ent_kw = text.find('class Entities', units_name_idx)
    brace_open = text.index('{', ent_kw)
    brace_close = find_block_end(text, brace_open)
    return brace_open, brace_close


def get_entities_bounds_for_anchor(text, anchor, search_start=0):
    """
    Find the Entities block of the group containing *anchor*.
    Returns (open_brace, close_brace).
    """
    anchor_idx = text.find(anchor, search_start)
    if anchor_idx == -1:
        return None, None
    # The anchor is inside a unit Object block which is inside an Entities block.
    # Walk backwards to find the Entities opening brace that is ancestor of anchor.
    # Find 'class Entities' before anchor_idx, then its opening brace.
    # We want the IMMEDIATE group Entities, not a deeper one.
    # Walk through the text from after 'class Entities' keyword search
    candidate_positions = []
    search = 0
    while True:
        pos = text.find('class Entities', search, anchor_idx)
        if pos == -1:
            break
        brace_open = text.index('{', pos)
        brace_close = find_block_end(text, brace_open)
        if brace_open < anchor_idx < brace_close:
            candidate_positions.append((brace_open, brace_close))
        search = pos + 1

    if not candidate_positions:
        return None, None
    # Return the innermost (smallest) block that contains anchor
    candidate_positions.sort(key=lambda x: x[1] - x[0])
    return candidate_positions[0]


def get_inner_entities_of_group(text, group_anchor):
    """
    Get the Entities block immediately inside a group block (the group is
    identified by group_anchor string within it).
    Returns (open_brace, close_brace) of the group's Entities block.
    """
    anchor_idx = text.find(group_anchor)
    if anchor_idx == -1:
        return None, None

    # Find the group block start — search backwards for 'dataType="Group"' then 'class Entities'
    # Actually: find the group's outer block, then find its first 'class Entities'
    # Search back from anchor for enclosing group
    # Use a different approach: find all 'class Entities' blocks that contain anchor,
    # pick the second-largest (group Entities, not unit Entities)

    candidate_positions = []
    search = 0
    while True:
        pos = text.find('class Entities', search, anchor_idx)
        if pos == -1:
            break
        brace_open = text.index('{', pos)
        brace_close = find_block_end(text, brace_open)
        if brace_open < anchor_idx < brace_close:
            candidate_positions.append((brace_open, brace_close, brace_close - brace_open))
        search = pos + 1

    if not candidate_positions:
        return None, None
    # Sort by size descending; take the second one (outermost containing both SL and other units)
    candidate_positions.sort(key=lambda x: -x[2])
    # The largest is the Units layer Entities. Second largest is the group Entities.
    if len(candidate_positions) >= 2:
        return candidate_positions[1][0], candidate_positions[1][1]
    return candidate_positions[0][0], candidate_positions[0][1]


def find_top_level_items_in_block(text, block_open, block_close):
    """
    Return list of (start_pos, item_number, block_text, block_end_excl)
    for each 'class ItemN' at depth 1 inside block_open..block_close.
    """
    results = []
    depth = 0
    i = block_open

    while i <= block_close:
        c = text[i]
        if c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                break

        if depth == 1:
            m = re.match(r'(class Item(\d+))', text[i:i+20])
            if m and (i == block_open + 1 or text[i-1] in '\n\t '):
                item_num = int(m.group(2))
                # extract block
                brace_s = text.index('{', i)
                brace_e = find_block_end(text, brace_s)
                end_excl = brace_e + 1
                if end_excl < len(text) and text[end_excl] == ';':
                    end_excl += 1
                results.append((i, item_num, text[i:end_excl], end_excl))
                i = end_excl
                continue
        i += 1

    return results


def parse_position(block_text):
    """Extract (x, y, z) floats from a position[]={...} line."""
    m = re.search(r'position\[\]=\{([^}]+)\}', block_text)
    if not m:
        return None
    parts = [p.strip() for p in m.group(1).split(',')]
    return float(parts[0]), float(parts[1]), float(parts[2])


def set_position(block_text, x, y, z):
    """Replace the position[]={...} with new coordinates."""
    return re.sub(
        r'position\[\]=\{[^}]+\}',
        f'position[]={{{x},{y},{z}}}',
        block_text,
        count=1
    )


def set_description(block_text, new_desc):
    """Replace description="..." with new_desc."""
    return re.sub(
        r'description="[^"]*"',
        f'description="{new_desc}"',
        block_text,
        count=1
    )


def clone_template(template_block, new_item_num, x, y, z, new_desc):
    """
    Take a template block (class ItemN { ... };), renumber it to new_item_num,
    set position and description.
    """
    # Renumber the class declaration
    result = re.sub(r'^class Item\d+', f'class Item{new_item_num}', template_block, count=1)
    result = set_position(result, x, y, z)
    result = set_description(result, new_desc)
    return result


# ---------------------------------------------------------------------------
# PHASE 1 HELPERS — Structural changes
# ---------------------------------------------------------------------------

PLACEHOLDER_COUNTER = [0]

def next_placeholder():
    PLACEHOLDER_COUNTER[0] += 1
    return f'PLACEHOLDER_{PLACEHOLDER_COUNTER[0]:03d}'


def reset_placeholders():
    PLACEHOLDER_COUNTER[0] = 0


def make_group_block(item_num, side, entities_items_text, group_id_placeholder, indent='\t\t\t'):
    """
    Construct a full group block:
        class ItemN { dataType="Group"; side=...; class Entities { ... }; class Attributes { }; id=PLACEHOLDER; };
    """
    i2 = indent + '\t'
    block = (
        f'{indent}class Item{item_num}\n'
        f'{indent}{{\n'
        f'{i2}dataType="Group";\n'
        f'{i2}side="{side}";\n'
        f'{i2}class Entities\n'
        f'{i2}{{\n'
        f'{entities_items_text}'
        f'{i2}}};\n'
        f'{i2}class Attributes\n'
        f'{i2}{{\n'
        f'{i2}}};\n'
        f'{i2}id={group_id_placeholder};\n'
        f'{indent}}};\n'
    )
    return block


def build_entities_block(items_list, indent='\t\t\t\t'):
    """
    items_list: list of block strings (already formatted as class ItemN { ... };)
    Returns the items=N; + class Item0 ... text (without outer braces).
    """
    n = len(items_list)
    result = f'{indent}items={n};\n'
    for blk in items_list:
        result += blk
    return result


# ---------------------------------------------------------------------------
# PHASE 1a — Remove Foxtrot squad
# ---------------------------------------------------------------------------

def remove_foxtrot(text):
    anchor = 'Squad Leader@Foxtrot'
    if anchor not in text:
        print('  [SKIP] Foxtrot not found')
        return text

    ue_open, ue_close = get_units_entities_bounds(text)
    items = find_top_level_items_in_block(text, ue_open, ue_close)

    foxtrot_start = -1
    foxtrot_end = -1
    for (start, num, blk, end_excl) in items:
        if anchor in blk:
            foxtrot_start = start
            foxtrot_end = end_excl
            print(f'  [1a] Removing Item{num} (Foxtrot) at char {start}')
            break

    if foxtrot_start == -1:
        print('  [SKIP] Foxtrot group block not found')
        return text

    # Also consume any leading whitespace/newline before the block
    remove_from = foxtrot_start
    while remove_from > 0 and text[remove_from - 1] in '\t ':
        remove_from -= 1
    if remove_from > 0 and text[remove_from - 1] == '\n':
        remove_from -= 1

    return text[:remove_from] + text[foxtrot_end:]


# ---------------------------------------------------------------------------
# PHASE 1b — Renumber downstream group Items
# ---------------------------------------------------------------------------

def renumber_downstream_items(text):
    """
    After Foxtrot (Item6) removal, renumber Item7->Item6 ... Item11->Item10
    at the Units Entities top level.
    """
    ue_open, ue_close = get_units_entities_bounds(text)
    items = find_top_level_items_in_block(text, ue_open, ue_close)

    # Find items that need renumbering (7 through 11 -> 6 through 10)
    renumber_map = {7: 6, 8: 7, 9: 8, 10: 9, 11: 10}

    # Do replacements from highest to lowest to avoid position shifting issues
    # We'll do it in one pass using the positions we already have
    # Collect (start_pos, old_class_decl, new_class_decl) in reverse order
    replacements = []
    for (start, num, blk, end_excl) in items:
        if num in renumber_map:
            new_num = renumber_map[num]
            old_decl = f'class Item{num}'
            new_decl = f'class Item{new_num}'
            replacements.append((start, old_decl, new_decl))
            print(f'  [1b] Renumber Item{num} -> Item{new_num}')

    # Apply from last to first to preserve positions
    replacements.sort(key=lambda x: -x[0])
    for (start, old_decl, new_decl) in replacements:
        decl_end = start + len(old_decl)
        text = text[:start] + new_decl + text[decl_end:]

    return text


# ---------------------------------------------------------------------------
# PHASE 1c — Update Units Entities items count
# ---------------------------------------------------------------------------

def update_units_entities_items_count(text):
    """Change items=12 -> items=15 in the Units Entities block."""
    ue_open, ue_close = get_units_entities_bounds(text)
    # The items= line is right after the opening brace
    segment = text[ue_open:ue_open + 30]
    m = re.search(r'items=(\d+);', segment)
    if m:
        old_count = int(m.group(1))
        pos = ue_open + m.start()
        print(f'  [1c] Units Entities items: {old_count} -> 15')
        text = text[:pos] + f'items=15;' + text[pos + len(m.group(0)):]
    else:
        print('  [WARN] Could not find items count in Units Entities')
    return text


# ---------------------------------------------------------------------------
# PHASE 1d — Remove Platoon Sergeant from Command HQ
# ---------------------------------------------------------------------------

def remove_platoon_sergeant(text):
    anchor = 'Platoon Sergeant'
    if anchor not in text:
        print('  [SKIP] Platoon Sergeant not found')
        return text

    # Find the Entities block of Command HQ (the group containing Platoon Sergeant)
    ent_open, ent_close = get_inner_entities_of_group(text, anchor)
    if ent_open is None:
        print('  [WARN] Could not find Command HQ Entities block')
        return text

    items = find_top_level_items_in_block(text, ent_open, ent_close)
    ps_start = -1
    ps_end = -1
    ps_num = -1
    for (start, num, blk, end_excl) in items:
        if anchor in blk:
            ps_start = start
            ps_end = end_excl
            ps_num = num
            print(f'  [1d] Removing Item{num} (Platoon Sergeant) from Command HQ')
            break

    if ps_start == -1:
        print('  [WARN] Platoon Sergeant block not found')
        return text

    # Remove the block (consume leading whitespace)
    remove_from = ps_start
    while remove_from > 0 and text[remove_from - 1] in '\t ':
        remove_from -= 1
    if remove_from > 0 and text[remove_from - 1] == '\n':
        remove_from -= 1

    return text[:remove_from] + text[ps_end:]


# ---------------------------------------------------------------------------
# PHASE 1e — Command HQ: Medic becomes Item2, items 4->3
# ---------------------------------------------------------------------------

def fix_command_hq_after_ps_removal(text):
    """
    After PS removal:
    - 'class Item3' containing Medic -> 'class Item2'
    - items=4 in Command HQ Entities -> items=3
    """
    anchor_medic = '"Medic"'
    # Find the Medic in Command HQ (first occurrence in units layer)
    ue_open, ue_close = get_units_entities_bounds(text)
    # Command HQ is Item0 in Units Entities
    items_top = find_top_level_items_in_block(text, ue_open, ue_close)
    cmd_hq_blk = None
    cmd_hq_start = -1
    cmd_hq_end = -1
    for (start, num, blk, end_excl) in items_top:
        if num == 0:  # Command HQ is Item0
            cmd_hq_blk = blk
            cmd_hq_start = start
            cmd_hq_end = end_excl
            break

    if cmd_hq_blk is None:
        print('  [WARN] Command HQ (Item0) not found')
        return text

    # Find Medic in Command HQ
    medic_rel = cmd_hq_blk.find('description="Medic"')
    if medic_rel == -1:
        print('  [WARN] Medic not found in Command HQ')
        return text

    medic_abs = cmd_hq_start + medic_rel

    # Find the class ItemN block containing Medic within Command HQ Entities
    # First, get the Command HQ Entities block
    cmd_ent_open_rel = cmd_hq_blk.find('class Entities')
    cmd_ent_brace_rel = cmd_hq_blk.index('{', cmd_ent_open_rel)
    cmd_ent_open = cmd_hq_start + cmd_ent_brace_rel
    cmd_ent_close = find_block_end(text, cmd_ent_open)

    items_cmd = find_top_level_items_in_block(text, cmd_ent_open, cmd_ent_close)

    medic_item_start = -1
    medic_item_end = -1
    medic_item_num = -1
    for (start, num, blk, end_excl) in items_cmd:
        if 'description="Medic"' in blk:
            medic_item_start = start
            medic_item_end = end_excl
            medic_item_num = num
            break

    if medic_item_start == -1:
        print('  [WARN] Medic item block not found in Command HQ')
        return text

    print(f'  [1e] Renaming Command HQ Item{medic_item_num} (Medic) -> Item2')
    old_decl = f'class Item{medic_item_num}'
    new_decl = 'class Item2'
    text = text[:medic_item_start] + new_decl + text[medic_item_start + len(old_decl):]

    # Now update items=4 -> items=3 in Command HQ Entities
    # Re-get after text modification
    ue_open2, ue_close2 = get_units_entities_bounds(text)
    items_top2 = find_top_level_items_in_block(text, ue_open2, ue_close2)
    for (start, num, blk, end_excl) in items_top2:
        if num == 0:
            cmd_hq_start2 = start
            cmd_ent_kw = text.find('class Entities', cmd_hq_start2)
            cmd_ent_brace = text.index('{', cmd_ent_kw)
            # items= line is just after '{'
            seg = text[cmd_ent_brace:cmd_ent_brace + 30]
            m = re.search(r'items=(\d+);', seg)
            if m:
                old_n = int(m.group(1))
                pos = cmd_ent_brace + m.start()
                print(f'  [1e] Command HQ Entities items: {old_n} -> 3')
                text = text[:pos] + 'items=3;' + text[pos + len(m.group(0)):]
            break

    return text


# ---------------------------------------------------------------------------
# PHASE 1f — Move Mike squad -4 on X axis
# ---------------------------------------------------------------------------

def move_mike_squad(text):
    """Subtract 4.0 from X for all unit positions in Mike squad."""
    anchor = 'Squad Leader@Mike'
    if anchor not in text:
        print('  [SKIP] Mike squad not found')
        return text

    ue_open, ue_close = get_units_entities_bounds(text)
    top_items = find_top_level_items_in_block(text, ue_open, ue_close)

    mike_start = -1
    mike_end = -1
    for (start, num, blk, end_excl) in top_items:
        if anchor in blk:
            mike_start = start
            mike_end = end_excl
            print(f'  [1f] Found Mike squad in Item{num}')
            break

    if mike_start == -1:
        print('  [SKIP] Mike group block not found')
        return text

    mike_block = text[mike_start:mike_end]

    def shift_position(m):
        coords = m.group(1).split(',')
        x = float(coords[0]) - 4.0
        y = coords[1].strip()
        z = coords[2].strip()
        return f'position[]={{{x},{y},{z}}}'

    new_mike_block = re.sub(r'position\[\]=\{([^}]+)\}', shift_position, mike_block)
    count = len(re.findall(r'position\[\]=\{', mike_block))
    print(f'  [1f] Shifted {count} positions in Mike squad by -4 on X')

    return text[:mike_start] + new_mike_block + text[mike_end:]


# ---------------------------------------------------------------------------
# PHASE 1g — Restructure infantry squads
# ---------------------------------------------------------------------------

def extract_unit_item_blocks(text, group_anchor):
    """
    Extract the class ItemN blocks inside the named group's Entities.
    Returns list of (item_num, block_text) sorted by item_num.
    """
    ent_open, ent_close = get_inner_entities_of_group(text, group_anchor)
    if ent_open is None:
        return []
    items = find_top_level_items_in_block(text, ent_open, ent_close)
    return [(num, blk) for (start, num, blk, end_excl) in items]


def read_alpha_templates(text):
    """
    Read template unit blocks from Alpha squad.
    Returns dict with keys: 'lat', 'ce', 'ar', 'marksman', 'mg'
    """
    templates = {}
    squad = 'Squad Leader@Alpha'

    ent_open, ent_close = get_inner_entities_of_group(text, squad)
    if ent_open is None:
        raise ValueError('Alpha squad Entities not found')

    items = find_top_level_items_in_block(text, ent_open, ent_close)

    for (start, num, blk, end_excl) in items:
        if 'description="Light Anti-Tank"' in blk:
            templates['lat'] = blk
        elif 'description="Combat Engineer"' in blk:
            templates['ce'] = blk
        elif 'description="Automatic Rifleman"' in blk:
            templates['ar'] = blk
        elif 'description="Marksman"' in blk:
            templates['marksman'] = blk
        elif 'description="Machine Gunner"' in blk:
            templates['mg'] = blk

    missing = [k for k in ('lat', 'ce', 'ar', 'marksman', 'mg') if k not in templates]
    if missing:
        print(f'  [WARN] Alpha templates missing: {missing}')

    return templates


def restructure_infantry_squad(text, squad_name, templates, squad_type):
    """
    squad_type: 'ace' (Alpha/Charlie/Echo) or 'bde' (Bravo/Delta)
    Restructure the squad's Entities from 8 items to 9 items.
    Returns modified text.
    """
    anchor = f'Squad Leader@{squad_name}'
    if anchor not in text:
        print(f'  [SKIP] {squad_name} squad not found')
        return text

    ent_open, ent_close = get_inner_entities_of_group(text, anchor)
    if ent_open is None:
        print(f'  [WARN] Could not find {squad_name} Entities block')
        return text

    items = find_top_level_items_in_block(text, ent_open, ent_close)
    items_dict = {num: blk for (start, num, blk, end_excl) in items}

    # Extract key blocks
    sl_block = items_dict.get(0)
    tl_block = items_dict.get(4)  # Team Leader (GL)
    medic_block = items_dict.get(7)

    if sl_block is None or tl_block is None or medic_block is None:
        print(f'  [WARN] {squad_name}: Missing SL/TL/Medic blocks (found items: {sorted(items_dict.keys())})')
        return text

    # Parse positions
    sl_pos = parse_position(sl_block)
    tl_pos = parse_position(tl_block)
    if sl_pos is None or tl_pos is None:
        print(f'  [WARN] {squad_name}: Could not parse positions')
        return text

    sl_x, sl_y, sl_z = sl_pos
    tl_x, tl_y, tl_z = tl_pos

    print(f'  [1g] Restructuring {squad_name}: SL pos={sl_pos}, TL pos={tl_pos}')

    # Determine descriptions based on squad type
    if squad_type == 'ace':  # Alpha, Charlie, Echo
        item1_desc = 'Breacher'
        item2_desc = 'Rifleman (LAT)'
        item2_tmpl = 'lat'
    else:  # Bravo, Delta
        item1_desc = 'Scout'
        item2_desc = 'Machine Gunner'
        item2_tmpl = 'mg'

    def make_unit(tmpl_key, item_num, x, y, z, desc):
        blk = templates[tmpl_key]
        result = re.sub(r'^class Item\d+', f'class Item{item_num}', blk, count=1)
        result = set_position(result, x, y, z)
        result = set_description(result, desc)
        # Assign a unique placeholder ID (template blocks share the same source ID)
        uid = next_placeholder()
        result = re.sub(r'\bid=\d+;', f'id={uid};', result, count=1)
        return result

    def renumber_block(blk, new_num):
        return re.sub(r'^class Item\d+', f'class Item{new_num}', blk, count=1)

    # Build 9 new items
    new_items = []

    # Item0: SL (unchanged)
    new_items.append(renumber_block(sl_block, 0))

    # Item1: LAT template, Breacher or Scout
    if 'lat' in templates:
        new_items.append(make_unit('lat', 1, sl_x, sl_y, sl_z - 2.0, item1_desc))
    else:
        new_items.append(renumber_block(sl_block, 1))  # fallback

    # Item2: LAT or MG depending on squad type
    if item2_tmpl in templates:
        new_items.append(make_unit(item2_tmpl, 2, sl_x, sl_y, sl_z - 4.0, item2_desc))
    else:
        new_items.append(renumber_block(sl_block, 2))

    # Item3: Combat Engineer
    if 'ce' in templates:
        new_items.append(make_unit('ce', 3, sl_x, sl_y, sl_z - 6.0, 'Combat Engineer'))
    else:
        new_items.append(renumber_block(sl_block, 3))

    # Item4: TL (unchanged, keep verbatim)
    new_items.append(renumber_block(tl_block, 4))

    # Item5: Auto-Rifleman
    if 'ar' in templates:
        new_items.append(make_unit('ar', 5, tl_x, tl_y, tl_z - 2.0, 'Automatic Rifleman'))
    else:
        new_items.append(renumber_block(tl_block, 5))

    # Item6: Marksman
    if 'marksman' in templates:
        new_items.append(make_unit('marksman', 6, tl_x, tl_y, tl_z - 4.0, 'Marksman'))
    else:
        new_items.append(renumber_block(tl_block, 6))

    # Item7: LAT Rifleman
    if 'lat' in templates:
        new_items.append(make_unit('lat', 7, tl_x, tl_y, tl_z - 6.0, 'Rifleman (LAT)'))
    else:
        new_items.append(renumber_block(tl_block, 7))

    # Item8: Medic (keep loadout, update position and Y shift)
    medic_result = renumber_block(medic_block, 8)
    medic_result = set_position(medic_result, tl_x, sl_y - 2.0, tl_z - 8.0)
    new_items.append(medic_result)

    # Build new entities block content
    new_ent_content = f'\t\t\t\t\titems=9;\n'
    for blk in new_items:
        new_ent_content += blk

    # Determine the indentation of the Entities block content
    # The ent_open is the '{', content starts after it
    # Replace the content of ent_open..ent_close
    new_text = text[:ent_open + 1] + '\n' + new_ent_content + text[ent_close - 1:]
    # Wait, that's not right. Let me do it properly.
    # We want to replace text[ent_open+1 : ent_close] with new content, keeping '}' at ent_close

    # Actually rebuild the whole entities block inline
    new_ent_block = '{\n' + new_ent_content + text[ent_close - 1:ent_close + 1]
    # Hmm, let me just replace the inner content

    inner_start = ent_open + 1  # after '{'
    inner_end = ent_close  # the '}'
    new_inner = '\n' + new_ent_content

    return text[:inner_start] + new_inner + text[inner_end:]


# ---------------------------------------------------------------------------
# PHASE 1h-1k — Add new squads
# ---------------------------------------------------------------------------

def get_mike_sl_info(text):
    """Get Mike SL's X and Z positions after the -4 shift."""
    anchor = 'Squad Leader@Mike'
    ent_open, ent_close = get_inner_entities_of_group(text, anchor)
    if ent_open is None:
        return None, None, None
    items = find_top_level_items_in_block(text, ent_open, ent_close)
    for (start, num, blk, end_excl) in items:
        if num == 0:
            pos = parse_position(blk)
            if pos:
                return pos  # x, y, z
    return None, None, None


def build_unit_block(tmpl_block, item_num, x, y, z, desc, id_placeholder):
    """Build a unit block from template with new item num, position, desc, id."""
    result = re.sub(r'^class Item\d+', f'class Item{item_num}', tmpl_block, count=1)
    result = set_position(result, x, y, z)
    result = set_description(result, desc)
    # Replace id=N; with placeholder
    result = re.sub(r'\bid=\d+;', f'id={id_placeholder};', result, count=1)
    return result


def detect_faction_side(text):
    """Detect the faction side from Alpha squad's group block.
    Returns 'West', 'East', or 'Independent'.
    """
    # Find the group block that contains Squad Leader@Alpha and read its side= field
    anchor = 'Squad Leader@Alpha'
    idx = text.find(f'description="{anchor}"')
    if idx == -1:
        return 'Independent'  # safe fallback
    # Search backwards for the group-level side= (should be within ~2000 chars before anchor)
    search_region = text[max(0, idx - 2000):idx]
    # Find the last side= occurrence before the anchor
    m = None
    for match in re.finditer(r'side="(West|East|Independent)"', search_region):
        m = match
    if m:
        return m.group(1)
    return 'Independent'


def add_xray_squad(text, sl_template, lat_template, marksman_template, mike_y, mike_z_sl, mike_z_tl, faction_side):
    """Add Xray squad as Item11."""
    # Xray X = 14.365662 + 4 = 18.365662 (Mike was at 18.365662, moved to 14.365662, Xray goes back to 18.365662)
    x = 18.365662
    y = mike_y
    z_sl = mike_z_sl
    z_mark = mike_z_tl  # use TL Z from Mike as third member offset

    gid = next_placeholder()
    uid0 = next_placeholder()
    uid1 = next_placeholder()
    uid2 = next_placeholder()

    item0 = build_unit_block(sl_template, 0, x, y, z_sl, 'Squad Leader@Xray', uid0)
    item1 = build_unit_block(marksman_template, 1, x, y, z_sl - 2.0, 'Sniper', uid1)
    item2 = build_unit_block(lat_template, 2, x, y, z_mark, 'Spotter', uid2)

    ent_items = f'\t\t\t\t\titems=3;\n{item0}{item1}{item2}'

    return make_group_block(11, faction_side, ent_items, gid)


def add_lima_squad(text, sl_template, ce_template, mike_y, mike_z_sl, faction_side):
    """Add Lima squad as Item12: SL + 3x Sapper."""
    x = 22.365662
    y = mike_y
    z = mike_z_sl

    gid = next_placeholder()
    uid0 = next_placeholder()
    uid1 = next_placeholder()
    uid2 = next_placeholder()
    uid3 = next_placeholder()

    item0 = build_unit_block(sl_template, 0, x, y, z, 'Squad Leader@Lima', uid0)
    item1 = build_unit_block(ce_template, 1, x, y, z - 2.0, 'Sapper', uid1)
    item2 = build_unit_block(ce_template, 2, x, y, z - 4.0, 'Sapper', uid2)
    item3 = build_unit_block(ce_template, 3, x, y, z - 6.0, 'Sapper', uid3)

    ent_items = f'\t\t\t\t\titems=4;\n{item0}{item1}{item2}{item3}'

    return make_group_block(12, faction_side, ent_items, gid)


def add_sierra_squad(text, sl_template, ce_template, mike_y, mike_z_sl, faction_side):
    """Add Sierra squad as Item13: SL + 2x Systems Specialist."""
    x = 26.365662
    y = mike_y
    z = mike_z_sl

    gid = next_placeholder()
    uid0 = next_placeholder()
    uid1 = next_placeholder()
    uid2 = next_placeholder()

    item0 = build_unit_block(sl_template, 0, x, y, z, 'Squad Leader@Sierra', uid0)
    item1 = build_unit_block(ce_template, 1, x, y, z - 2.0, 'Systems Specialist', uid1)
    item2 = build_unit_block(ce_template, 2, x, y, z - 4.0, 'Systems Specialist', uid2)

    ent_items = f'\t\t\t\t\titems=3;\n{item0}{item1}{item2}'

    return make_group_block(13, faction_side, ent_items, gid)


def get_golf1_crew_template(text):
    """Get the Vehicle Crew (non-lead) template from Golf 1."""
    anchor = 'Vehicle Crew Lead@Golf 1'
    ent_open, ent_close = get_inner_entities_of_group(text, anchor)
    if ent_open is None:
        print('  [WARN] Golf 1 group not found')
        return None
    items = find_top_level_items_in_block(text, ent_open, ent_close)
    for (start, num, blk, end_excl) in items:
        if 'description="Vehicle Crew"' in blk and num == 1:
            return blk
    # Try any Vehicle Crew
    for (start, num, blk, end_excl) in items:
        if 'description="Vehicle Crew"' in blk:
            return blk
    return None


def get_golf1_sl_template(text):
    """Get the Vehicle Crew Lead template from Golf 1 (SL equivalent for India)."""
    anchor = 'Vehicle Crew Lead@Golf 1'
    ent_open, ent_close = get_inner_entities_of_group(text, anchor)
    if ent_open is None:
        return None
    items = find_top_level_items_in_block(text, ent_open, ent_close)
    for (start, num, blk, end_excl) in items:
        if num == 0:
            return blk
    return None


def add_india_squad(text, crew_lead_template, crew_template, mike_y, mike_z_sl, faction_side):
    """Add India squad as Item14: 3x crew."""
    x = 30.365662
    y = mike_y
    z = mike_z_sl

    gid = next_placeholder()
    uid0 = next_placeholder()
    uid1 = next_placeholder()
    uid2 = next_placeholder()

    item0 = build_unit_block(crew_lead_template, 0, x, y, z, 'Squad leader@India', uid0)
    item1 = build_unit_block(crew_template, 1, x, y, z - 2.0, 'Mortar Gunner', uid1)
    item2 = build_unit_block(crew_template, 2, x, y, z - 4.0, 'Assistant Gunner', uid2)

    ent_items = f'\t\t\t\t\titems=3;\n{item0}{item1}{item2}'

    return make_group_block(14, faction_side, ent_items, gid)


def inject_new_squads(text, xray_blk, lima_blk, sierra_blk, india_blk):
    """Append the 4 new squad blocks before the closing brace of Units Entities."""
    ue_open, ue_close = get_units_entities_bounds(text)

    # Find the position just before the closing brace
    # The closing brace is at ue_close
    # We insert before any trailing whitespace before the '}'
    insert_pos = ue_close
    # Walk back to find the end of the last item
    # Insert the new blocks with proper indentation
    new_content = xray_blk + lima_blk + sierra_blk + india_blk

    return text[:insert_pos] + new_content + text[insert_pos:]


# ---------------------------------------------------------------------------
# PHASE 2 — ID remapping
# ---------------------------------------------------------------------------

def remap_ids(text):
    """Resequence all IDs from 1."""
    # Find all ids in order of appearance
    # Matches both integer IDs and PLACEHOLDER_XXX
    pattern = re.compile(r'\bid=((?:\d+|PLACEHOLDER_\w+));')
    matches = list(pattern.finditer(text))

    # Build ordered unique list
    seen = {}
    ordered = []
    for m in matches:
        old_id = m.group(1)
        if old_id not in seen:
            seen[old_id] = None
            ordered.append(old_id)

    # Assign new sequential IDs starting from 1
    id_map = {}
    counter = 1
    for old_id in ordered:
        id_map[old_id] = counter
        counter += 1

    print(f'  [2] Remapping {len(id_map)} unique IDs (1 to {counter-1})')

    # Replace all occurrences
    # For integer IDs, use word boundary matching to avoid sub-matches
    # Sort by length descending to avoid replacing sub-matches first

    def replace_id_in_text(txt, old_id_str, new_id_str):
        # Replace id=OLD; occurrences
        txt = re.sub(r'\bid=' + re.escape(old_id_str) + r';', f'id={new_id_str};', txt)
        # Replace item0=OLD; and item1=OLD; in connections
        txt = re.sub(r'\bitem0=' + re.escape(old_id_str) + r';', f'item0={new_id_str};', txt)
        txt = re.sub(r'\bitem1=' + re.escape(old_id_str) + r';', f'item1={new_id_str};', txt)
        return txt

    # Sort by length of old_id descending to prevent partial replacement
    sorted_items = sorted(id_map.items(), key=lambda x: -len(x[0]))
    for old_id, new_id in sorted_items:
        text = replace_id_in_text(text, str(old_id), str(new_id))

    return text, id_map


# ---------------------------------------------------------------------------
# PHASE 3 — Rebuild connections section
# ---------------------------------------------------------------------------

def find_playable_units(text):
    """
    Find all playable unit IDs and their descriptions.
    Returns list of (id, description) tuples.
    """
    # Pattern: within a block containing dataType="Object" and isPlayable=1,
    # find the id=N; after the Attributes close
    units = []

    # Find all Object blocks with isPlayable=1
    # Strategy: scan for isPlayable=1, then find enclosing block's id
    for m in re.finditer(r'isPlayable=1', text):
        pos = m.start()
        # Find the description in the same Attributes block
        # The Attributes block contains isPlayable
        # Search backwards for class Attributes {
        attr_start = text.rfind('class Attributes', 0, pos)
        if attr_start == -1:
            continue
        attr_brace = text.index('{', attr_start)
        attr_close = find_block_end(text, attr_brace)

        desc_match = re.search(r'description="([^"]*)"', text[attr_brace:attr_close])
        desc = desc_match.group(1) if desc_match else ''

        # Find id=N; after the Attributes block (it's at the Object level)
        id_match = re.search(r'\bid=(\d+);', text[attr_close:attr_close + 200])
        if id_match:
            unit_id = int(id_match.group(1))
            units.append((unit_id, desc))

    return units


def find_selector_ids(text):
    """
    Find the IDs of the three selector hosts (fnf_module_selectorHost objects).
    The id= appears BEFORE the type= and CustomAttributes in the block.
    Returns dict: {'Marksman Optics': id, 'Optics': id, 'Explosives': id}
    """
    selectors = {}
    for name in ('Marksman Optics', 'Optics', 'Explosives'):
        # Find value="NAME" within CustomAttributes of the selectorHost
        idx = text.find(f'value="{name}"')
        if idx == -1:
            continue
        # Find the fnf_module_selectorHost type declaration before this value
        sh_idx = text.rfind('fnf_module_selectorHost', 0, idx)
        if sh_idx == -1:
            continue
        # The id= is in the block header, between the class ItemN opening brace and the type= line
        # Search backwards from sh_idx for the most recent id=N;
        search_region = text[max(0, sh_idx - 400):sh_idx]
        all_ids = re.findall(r'\bid=(\d+);', search_region)
        if all_ids:
            selectors[name] = int(all_ids[-1])

    return selectors


def parse_existing_connections(text, playable_ids_set):
    """
    Parse the existing connections block.
    Returns (infrastructure_links, all_links_text_start, all_links_text_end).
    infrastructure_links: list of (linkID, item0, item1) tuples where item0 is not a playable unit.
    Only keeps links where both item0 and item1 reference valid entity IDs still present in the file.
    """
    conn_start = text.find('class connections')
    if conn_start == -1:
        return [], -1, -1

    links_start = text.find('class Links', conn_start)
    links_brace = text.index('{', links_start)
    links_close = find_block_end(text, links_brace)

    # Collect all valid entity IDs from the file (those that appear as id=N; in the body)
    valid_ids = set(int(m) for m in re.findall(r'\bid=(\d+);', text[:conn_start]))

    infrastructure = []
    # Parse each Item block in Links
    items = find_top_level_items_in_block(text, links_brace, links_close)
    for (start, num, blk, end_excl) in items:
        link_id_m = re.search(r'linkID=(\d+);', blk)
        item0_m = re.search(r'item0=(\d+);', blk)
        item1_m = re.search(r'item1=(\d+);', blk)
        if link_id_m and item0_m and item1_m:
            link_id = int(link_id_m.group(1))
            item0 = int(item0_m.group(1))
            item1 = int(item1_m.group(1))
            # Only keep link if item0 is not a playable unit AND both IDs are still valid
            if item0 not in playable_ids_set and item0 in valid_ids and item1 in valid_ids:
                infrastructure.append((link_id, item0, item1))

    return infrastructure, conn_start, links_close + 1


def build_connections_block(infra_links, unit_sync_links):
    """Build the full connections block text."""
    total = len(infra_links) + len(unit_sync_links)

    indent = '\t'
    i2 = '\t\t'
    i3 = '\t\t\t'
    i4 = '\t\t\t\t'

    def link_block(link_num, item0, item1):
        return (
            f'{i3}class Item{link_num}\n'
            f'{i3}{{\n'
            f'{i4}linkID={link_num};\n'
            f'{i4}item0={item0};\n'
            f'{i4}item1={item1};\n'
            f'{i4}class CustomData\n'
            f'{i4}{{\n'
            f'{i4}\ttype="Sync";\n'
            f'{i4}}};\n'
            f'{i3}}};\n'
        )

    links_text = ''
    link_num = 0
    for (_, item0, item1) in infra_links:
        links_text += link_block(link_num, item0, item1)
        link_num += 1
    for (item0, item1) in unit_sync_links:
        links_text += link_block(link_num, item0, item1)
        link_num += 1

    block = (
        f'class connections\n'
        f'{{\n'
        f'{i2}class LinkIDProvider\n'
        f'{i2}{{\n'
        f'{i3}nextID={total};\n'
        f'{i2}}};\n'
        f'{i2}class Links\n'
        f'{i2}{{\n'
        f'{i3}items={total};\n'
        f'{links_text}'
        f'{i2}}};\n'
        f'}};\n'
    )
    return block


# ---------------------------------------------------------------------------
# MAIN PIPELINE
# ---------------------------------------------------------------------------

def transform(content):
    """Run the full transformation pipeline on the file content string."""
    reset_placeholders()

    print('\n=== PHASE 1: Structural changes ===')

    # Check for standard infantry structure
    if 'description="Squad Leader@Alpha"' not in content:
        print('  [SKIP] Not a standard infantry composition (no Squad Leader@Alpha)')
        return None

    # Check if already transformed (no Foxtrot and already has new squads)
    if ('Squad Leader@Foxtrot' not in content and
            'Squad Leader@Xray' in content and
            ('Squad leader@India' in content or 'Squad Leader@India' in content)):
        print('  [SKIP] File appears to already be transformed (no Foxtrot, Xray/India present)')
        return None

    # Detect faction side from Alpha squad before any changes
    faction_side = detect_faction_side(content)
    print(f'  [1] Detected faction side: {faction_side}')

    # 1a — Remove Foxtrot
    content = remove_foxtrot(content)

    # 1b — Renumber downstream Items
    content = renumber_downstream_items(content)

    # 1c — Update Units Entities items count
    content = update_units_entities_items_count(content)

    # 1d — Remove Platoon Sergeant
    content = remove_platoon_sergeant(content)

    # 1e — Fix Command HQ
    content = fix_command_hq_after_ps_removal(content)

    # 1f — Move Mike squad
    content = move_mike_squad(content)

    # Read templates from Alpha BEFORE restructuring (Alpha is still original at this point)
    print('  [1g] Reading Alpha squad templates...')
    templates = read_alpha_templates(content)
    print(f'       Templates found: {list(templates.keys())}')

    # Read SL template from Alpha for new squads
    alpha_ent_open, alpha_ent_close = get_inner_entities_of_group(content, 'Squad Leader@Alpha')
    alpha_items = find_top_level_items_in_block(content, alpha_ent_open, alpha_ent_close)
    alpha_sl_template = next((blk for (s, n, blk, e) in alpha_items if n == 0), None)

    # 1g — Restructure infantry squads
    squads = [
        ('Alpha', 'ace'),
        ('Bravo', 'bde'),
        ('Charlie', 'ace'),
        ('Delta', 'bde'),
        ('Echo', 'ace'),
    ]
    for squad_name, squad_type in squads:
        print(f'  [1g] Restructuring {squad_name} ({squad_type})...')
        content = restructure_infantry_squad(content, squad_name, templates, squad_type)

    # Get Mike SL position for new squads
    mike_x, mike_y, mike_z_sl = get_mike_sl_info(content)
    print(f'  [1h-1k] Mike SL post-shift position: x={mike_x}, y={mike_y}, z={mike_z_sl}')

    # For Xray, use Mike's Z values: sl_z=3.9345627 (approx), tl_z roughly sl_z - 4.065
    # Actually use actual values from Mike
    mike_ent_open, mike_ent_close = get_inner_entities_of_group(content, 'Squad Leader@Mike')
    mike_items = find_top_level_items_in_block(content, mike_ent_open, mike_ent_close)
    mike_items_dict = {n: blk for (s, n, blk, e) in mike_items}
    mike_sl_block = mike_items_dict.get(0)
    mike_sl_pos = parse_position(mike_sl_block) if mike_sl_block else None
    if mike_sl_pos:
        mike_z_sl = mike_sl_pos[2]
        mike_y = mike_sl_pos[1]

    # For Xray's third member Z, use sl_z - 4.065 (approximate from spec)
    # The spec says Z positions are: SL at z_sl, then -2.0 each, then TL at sl_z-8.065
    # Xray has 3 members: SL, Sniper, Spotter
    # Z values: z_sl, z_sl-2.0, z_sl-4.065 (use actual from Mike if available)
    mike_third_z = mike_z_sl - 4.065437317  # approximate from spec

    # Get Golf 1 crew templates for India
    golf1_sl_tmpl = get_golf1_sl_template(content)
    golf1_crew_tmpl = get_golf1_crew_template(content)
    if golf1_crew_tmpl is None:
        print('  [WARN] Could not find Golf 1 crew template, using Alpha SL template')
        golf1_crew_tmpl = alpha_sl_template
    if golf1_sl_tmpl is None:
        golf1_sl_tmpl = alpha_sl_template

    # 1h — Add Xray
    print('  [1h] Adding Xray squad as Item11...')
    xray_blk = add_xray_squad(
        content,
        alpha_sl_template,
        templates.get('lat', alpha_sl_template),
        templates.get('marksman', alpha_sl_template),
        mike_y,
        mike_z_sl,
        mike_third_z,
        faction_side
    )

    # 1i — Add Lima
    print('  [1i] Adding Lima squad as Item12...')
    lima_blk = add_lima_squad(
        content,
        alpha_sl_template,
        templates.get('ce', alpha_sl_template),
        mike_y,
        mike_z_sl,
        faction_side
    )

    # 1j — Add Sierra
    print('  [1j] Adding Sierra squad as Item13...')
    sierra_blk = add_sierra_squad(
        content,
        alpha_sl_template,
        templates.get('ce', alpha_sl_template),
        mike_y,
        mike_z_sl,
        faction_side
    )

    # 1k — Add India
    print('  [1k] Adding India squad as Item14...')
    india_blk = add_india_squad(
        content,
        golf1_sl_tmpl,
        golf1_crew_tmpl,
        mike_y,
        mike_z_sl,
        faction_side
    )

    # Inject new squads
    content = inject_new_squads(content, xray_blk, lima_blk, sierra_blk, india_blk)

    print('\n=== PHASE 2: ID remapping ===')
    content, id_map = remap_ids(content)

    print('\n=== PHASE 3: Rebuild connections ===')
    playable_units = find_playable_units(content)
    print(f'  [3] Found {len(playable_units)} playable units')

    playable_ids_set = {uid for uid, _ in playable_units}

    # Find selector IDs
    selector_ids = find_selector_ids(content)
    print(f'  [3] Selector IDs: {selector_ids}')

    optics_id = selector_ids.get('Optics')
    marksman_optics_id = selector_ids.get('Marksman Optics')
    explosives_id = selector_ids.get('Explosives')

    # Parse existing connections
    infra_links, conn_start, conn_end = parse_existing_connections(content, playable_ids_set)
    print(f'  [3b] Infrastructure links: {len(infra_links)}')

    # Generate unit sync links
    unit_sync_links = []
    for unit_id, desc in playable_units:
        # All units get Optics (if selector exists)
        if optics_id is not None:
            unit_sync_links.append((unit_id, optics_id))

        # Marksmen/Snipers also get Marksman Optics
        if marksman_optics_id and re.search(r'Marksman|Sniper', desc, re.IGNORECASE):
            unit_sync_links.append((unit_id, marksman_optics_id))

        # CEs/Sappers/SysSpecs get Explosives
        if explosives_id and re.search(r'Combat Engineer|Sapper|Systems Specialist', desc, re.IGNORECASE):
            unit_sync_links.append((unit_id, explosives_id))

    print(f'  [3c] Unit sync links generated: {len(unit_sync_links)}')

    # Build new connections block
    new_conn = build_connections_block(infra_links, unit_sync_links)

    if conn_start != -1:
        content = content[:conn_start] + new_conn
    else:
        content += '\n' + new_conn

    return content


# ---------------------------------------------------------------------------
# VERIFICATION
# ---------------------------------------------------------------------------

def verify(content, output_path):
    """Run verification checks and print results."""
    print('\n=== VERIFICATION ===')
    results = []

    def check(label, passed, extra=''):
        status = 'PASS' if passed else 'FAIL'
        msg = f'  [{status}] {label}'
        if extra:
            msg += f': {extra}'
        print(msg)
        results.append(passed)
        return passed

    # Count groups in Units Entities
    try:
        ue_open, ue_close = get_units_entities_bounds(content)
        top_items = find_top_level_items_in_block(content, ue_open, ue_close)
        group_count = len([i for i in top_items if 'dataType="Group"' in i[2]])
        check('Total groups in Units Entities == 15', group_count == 15, str(group_count))
    except Exception as e:
        check('Total groups in Units Entities == 15', False, str(e))

    check('No Foxtrot squad', 'Squad Leader@Foxtrot' not in content)
    check('Xray squad present', 'Squad Leader@Xray' in content)
    check('India squad present', 'Squad leader@India' in content or 'Squad Leader@India' in content)
    check('No Platoon Sergeant', 'Platoon Sergeant' not in content)

    # Check sync links
    playable_units = find_playable_units(content)
    selector_ids = find_selector_ids(content)
    optics_id = selector_ids.get('Optics')
    marksman_optics_id = selector_ids.get('Marksman Optics')
    explosives_id = selector_ids.get('Explosives')

    # Parse connections
    playable_ids_set = {uid for uid, _ in playable_units}
    conn_start = content.find('class connections')
    if conn_start != -1:
        links_start = content.find('class Links', conn_start)
        links_brace = content.index('{', links_start)
        links_close = find_block_end(content, links_brace)
        link_items = find_top_level_items_in_block(content, links_brace, links_close)

        # Build sets of (item0, item1) pairs
        sync_pairs = set()
        for (s, n, blk, e) in link_items:
            i0m = re.search(r'item0=(\d+);', blk)
            i1m = re.search(r'item1=(\d+);', blk)
            if i0m and i1m:
                sync_pairs.add((int(i0m.group(1)), int(i1m.group(1))))

        # Check all playable units have optics sync
        if optics_id:
            units_without_optics = [(uid, desc) for uid, desc in playable_units
                                     if (uid, optics_id) not in sync_pairs]
            check('All playable units have Optics sync',
                  len(units_without_optics) == 0,
                  f'{len(units_without_optics)} missing' if units_without_optics else '')

        # Check marksmen have marksman optics
        if marksman_optics_id:
            marksmen = [(uid, desc) for uid, desc in playable_units
                        if re.search(r'Marksman|Sniper', desc, re.IGNORECASE)]
            missing = [(uid, desc) for uid, desc in marksmen
                       if (uid, marksman_optics_id) not in sync_pairs]
            check('Marksmen/Snipers have Marksman Optics sync',
                  len(missing) == 0,
                  f'{len(missing)} missing' if missing else f'{len(marksmen)} marksmen checked')

        # Check CEs have explosives
        if explosives_id:
            ces = [(uid, desc) for uid, desc in playable_units
                   if re.search(r'Combat Engineer|Sapper|Systems Specialist', desc, re.IGNORECASE)]
            missing = [(uid, desc) for uid, desc in ces
                       if (uid, explosives_id) not in sync_pairs]
            check('CEs/Sappers/SysSpecs have Explosives sync',
                  len(missing) == 0,
                  f'{len(missing)} missing: {[d for _, d in missing[:5]]}' if missing else f'{len(ces)} checked')

        # Check no group-level IDs appear as item0 in unit sync links
        # (unit sync links are those where item0 IS a playable unit)
        # Group IDs should never be item0 in unit->selector sync links
        all_ids_in_file = set(int(m) for m in re.findall(r'\bid=(\d+);', content))
        selector_id_values = set(v for v in selector_ids.values() if v is not None)
        # Find all links where item0 is a playable unit
        unit_sync_item1s = set()
        for (s, n, blk, e) in link_items:
            i0m = re.search(r'item0=(\d+);', blk)
            i1m = re.search(r'item1=(\d+);', blk)
            if i0m and i1m:
                i0 = int(i0m.group(1))
                i1 = int(i1m.group(1))
                if i0 in playable_ids_set:
                    unit_sync_item1s.add(i1)
        # item1 in unit sync links should only be selector IDs
        bad_item1s = unit_sync_item1s - selector_id_values
        check('No non-selector IDs as item1 in unit sync links',
              len(bad_item1s) == 0,
              f'Found: {sorted(bad_item1s)[:5]}' if bad_item1s else '')

        # Check items= and nextID consistency
        items_m = re.search(r'items=(\d+);', content[links_brace:links_brace+30])
        next_id_m = re.search(r'nextID=(\d+);', content[conn_start:conn_start+200])
        if items_m and next_id_m:
            items_count = int(items_m.group(1))
            next_id = int(next_id_m.group(1))
            actual_links = len(link_items)
            check('connections items== and nextID== consistent',
                  items_count == next_id == actual_links,
                  f'items={items_count}, nextID={next_id}, actual={actual_links}')

    all_pass = all(results)
    print(f'\n  {"ALL CHECKS PASSED" if all_pass else "SOME CHECKS FAILED"} ({sum(results)}/{len(results)})')
    return all_pass


def compare_with_reference(output_path, reference_path):
    """Compare output with Dropbox reference."""
    if not os.path.exists(reference_path):
        print(f'\n  [SKIP] Reference file not found: {reference_path}')
        return

    print(f'\n=== COMPARISON WITH REFERENCE ===')
    print(f'  Reference: {reference_path}')

    with open(reference_path, 'r') as f:
        ref_content = f.read()
    with open(output_path, 'r') as f:
        out_content = f.read()

    # Compare squad counts
    ref_squads = re.findall(r'description="Squad Leader@\w+"', ref_content)
    out_squads = re.findall(r'description="Squad Leader@\w+"', out_content)
    print(f'  Squad Leaders - Reference: {len(ref_squads)}, Output: {len(out_squads)}')
    ref_squad_names = set(re.findall(r'Squad Leader@(\w+)', ref_content))
    out_squad_names = set(re.findall(r'Squad Leader@(\w+)', out_content))
    if ref_squad_names == out_squad_names:
        print(f'  Squad names match: {sorted(ref_squad_names)}')
    else:
        print(f'  DIFF - Reference squads: {sorted(ref_squad_names)}')
        print(f'  DIFF - Output squads: {sorted(out_squad_names)}')

    # Compare sync counts
    ref_links = len(re.findall(r'linkID=\d+', ref_content))
    out_links = len(re.findall(r'linkID=\d+', out_content))
    print(f'  Sync links - Reference: {ref_links}, Output: {out_links}')

    # Compare playable unit count
    ref_playable = len(re.findall(r'isPlayable=1', ref_content))
    out_playable = len(re.findall(r'isPlayable=1', out_content))
    print(f'  Playable units - Reference: {ref_playable}, Output: {out_playable}')

    # Compare key descriptions
    for desc in ['Breacher', 'Scout', 'Sapper', 'Systems Specialist', 'Sniper', 'Spotter',
                  'Mortar Gunner', 'Assistant Gunner', 'Squad Leader@Xray', 'Squad Leader@Lima',
                  'Squad Leader@Sierra', 'Squad leader@India']:
        ref_n = ref_content.count(f'description="{desc}"')
        out_n = out_content.count(f'description="{desc}"')
        status = 'OK' if ref_n == out_n else 'DIFF'
        if status == 'DIFF' or ref_n > 0:
            print(f'  [{status}] description="{desc}": ref={ref_n}, out={out_n}')


# ---------------------------------------------------------------------------
# ENTRY POINTS
# ---------------------------------------------------------------------------

def process_file(input_path, output_path=None):
    """Transform a single file."""
    if output_path is None:
        output_path = input_path

    print(f'\n{"="*60}')
    print(f'Processing: {input_path}')
    print(f'Output:     {output_path}')
    print('='*60)

    # Read input
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Check if this is a standard infantry composition
    if 'description="Squad Leader@Alpha"' not in content:
        print('  [SKIP] Not a standard infantry composition')
        return False

    # Backup
    bak_path = input_path + '.bak'
    shutil.copy2(input_path, bak_path)
    print(f'  Backup: {bak_path}')

    # Transform
    result = transform(content)
    if result is None:
        print('  [SKIP] Already transformed or unsupported structure')
        return False

    # Write output
    with open(output_path, 'w', encoding='utf-8', newline='') as f:
        f.write(result)
    print(f'\n  Written: {output_path}')

    # Verify
    all_pass = verify(result, output_path)

    # Compare with Dropbox reference if available
    reference_path = '//BIGBLACKBOX/Dropbox/composition.sqe'
    compare_with_reference(output_path, reference_path)

    return all_pass


def process_all(kits_dir):
    """Process all composition.sqe files under kits_dir."""
    print(f'Scanning: {kits_dir}')
    processed = 0
    skipped = 0

    for root, dirs, files in os.walk(kits_dir):
        for fname in files:
            if fname == 'composition.sqe':
                fpath = os.path.join(root, fname)
                with open(fpath, 'r', encoding='utf-8') as f:
                    content = f.read()
                if 'description="Squad Leader@Alpha"' not in content:
                    print(f'  [SKIP] {fpath}')
                    skipped += 1
                    continue
                success = process_file(fpath)
                if success:
                    processed += 1

    print(f'\nDone. Processed: {processed}, Skipped: {skipped}')


def main():
    parser = argparse.ArgumentParser(description='FNF composition.sqe transformer')
    parser.add_argument('--all', metavar='KITS_DIR', help='Process all compositions under directory')
    parser.add_argument('input', nargs='?', help='Input .sqe file')
    parser.add_argument('output', nargs='?', help='Output .sqe file (default: overwrite input)')

    args = parser.parse_args()

    if args.all:
        process_all(args.all)
    elif args.input:
        process_file(args.input, args.output)
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == '__main__':
    main()

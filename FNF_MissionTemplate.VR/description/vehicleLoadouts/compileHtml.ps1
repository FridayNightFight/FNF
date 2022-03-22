$t = Get-Content .\loadoutData.json -Raw
$r = $t | ConvertFrom-Json
$r | Select-Object * | Out-GridHtml -Title "FNF Vehicle Loadouts" -DisablePaging -FixedHeader -FilePath "FNF_VehicleLoadouts.html"




$Overwrite = Read-Host "Overwrite files? (y/n)"

$f = 0
$Folders = (Get-ChildItem -Directory) | Select-Object *
ForEach ($Folder in $Folders) {
	Write-Progress -Activity "Processing folders" -Status $Folder.Name -PercentComplete (($f / $Folders.Count) * 100) -Id 1
	$f++

	if (!(Test-Path "$($Folder.FullName)\Processed") -and $Overwrite.ToLower() -eq 'n') {
		New-Item -ItemType Directory "$($Folder.FullName)\Processed"
	}

	if ($Overwrite.ToLower() -eq 'y') {
		$ProcessedPath = $Folder.FullName
	} else {
		$ProcessedPath = "$($Folder.FullName)\Processed"
	}

	# Fix gamma & crop images
	$i = 0
	$Images = Get-ChildItem $Folder.FullName -File -Filter "*.png"  | Select-Object *
	ForEach ($Image in $Images) {
		Write-Progress -Activity "Fixing images" -Status $Image.Name -PercentComplete (($i / $Images.Count) * 100) -ParentId 1

		$ImageName = $image.name
		$ImageRootName = $image.name -replace '_F.png', '' -replace '_R.png', ''

		convert $image.fullname -brightness-contrast -10x20 "$ProcessedPath\$ImageName"
		convert "$ProcessedPath\$ImageName" -crop 980x1338+804+102 -gravity center "$ProcessedPath\$ImageName"
		
		$i++
		Start-Sleep 1;
	}

	
	# Combine images into twos
	$i = 0
	$Images = Get-ChildItem $Folder.FullName -File | Select-Object * | Sort-Object Name
	ForEach ($image in $Images) {
		Write-Progress -Activity "Combining images" -Status $Image.Name -PercentComplete (($i / $Images.Count) * 100) -ParentId 1
		$ImageRootName = $image.name -replace '_F.png', '' -replace '_R.png', ''
		
		cmd /c "montage ""$ProcessedPath\$ImageRootName`_F.png"" ""$ProcessedPath\$ImageRootName`_R.png"" -mode concatenate -tile 2x ""$ProcessedPath\$ImageRootName.png"""
		$i++
	}
	Start-Sleep 5;
	$Images = Get-ChildItem $ProcessedPath -File | Where-Object {
		$PSItem.Name -match '_F.png' -or $PSItem.Name -match '_R.png'
	} | Remove-Item -Force

	# Pause
}
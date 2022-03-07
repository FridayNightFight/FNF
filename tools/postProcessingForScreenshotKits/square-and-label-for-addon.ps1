
$folders = Get-ChildItem -Directory
ForEach ($folder in $folders) {
  Write-Progress -Activity "Processing images for addon" -Status $folder.FullName
  Set-Location $folder.FullName
  $images = Get-ChildItem -File -Filter "*.png"
  ForEach ($image in $images) {
    convert $image.FullName -shave 200x100 -background "#323837" -gravity center -extent 1560x1560 -font Tahoma -pointsize 120 -stroke "#000C" -strokewidth 4 -fill white -gravity Center -annotate 0 "$($image.BaseName)" $image.FullName
    # convert $image.FullName -shave 200x100 -background "#323837" -gravity center -extent 1560x1560 -font Tahoma -pointsize 120 -stroke "#000C" -strokewidth 4 -fill white -gravity Center -annotate 0 "$($image.BaseName)" "$($image.DirectoryName)\$($image.BaseName)_test.png"
    
    convert $image.FullName -depth 8 -sample 2048x2048 $image.FullName
    . "K:\SteamLibrary\steamapps\common\Arma 3 Tools\TexView2\Pal2PacE.exe" $image.FullName "$($image.DirectoryName)\$($image.BaseName).paa"
  }
  ForEach ($image in $images) {
    Remove-Item $image.FullName
  }
}
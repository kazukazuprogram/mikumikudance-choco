$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://drive.google.com/uc?id=1yU-gfmbQASkp3G3lv-TrYWQbMD96xQrq&export=download'
$url64      = 'https://drive.google.com/uc?id=1Iucxu0tDsD05Siyv8VBGgm9vjD-f-RhM&export=download'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $env:APPDATA
  fileType      = 'EXE_MSI_OR_MSU'
  url           = $url
  url64bit      = $url64

  softwareName  = 'mikumikudance*'

  checksum      = '3E15BA602A0F09714152D635814ECC80A39EA42CC5C53144E4AA297D07FC76B2'
  checksumType  = 'sha256'
  checksum64    = '7EDCCD3A29FAE3BFD217B2E75E526D13AC844828C7DBC927E959E3EECEE29874'
  checksumType64= 'sha256'
}


Install-ChocolateyZipPackage @packageArgs

$InstallPath = $(Convert-Path $(Join-Path $env:APPDATA MikuMikuDance_v932*))
echo $InstallPath
Install-ChocolateyPath $InstallPath -PathType "User"

Install-ChocolateyShortcut `
  -shortcutFilePath $(Join-Path $(Join-Path $env:HOMEDRIVE$env:HOMEPATH Desktop) MikuMikuDance.lnk) `
  -targetPath $InstallPath\MikuMikuDance.exe

# Script para baixar Office ProPlus 2024, espanhol ES, 64 bits com Excel, Word, PowerPoint, Access e Outlook

$xml = @"
<Configuration>
  <Add OfficeClientEdition="64" Channel="Current">
    <Product ID="ProPlus2024Retail">
      <Language ID="es-es" />
      <ExcludeApp ID="Groove" />
      <ExcludeApp ID="Lync" />
      <ExcludeApp ID="OneNote" />
      <ExcludeApp ID="Publisher" />
      <ExcludeApp ID="Teams" />
    </Product>
  </Add>
</Configuration>
"@

$xml | Out-File -Encoding UTF8 .\config.xml
Invoke-WebRequest -Uri "https://aka.ms/office-deployment" -OutFile "setup.exe"
Start-Process -FilePath ".\setup.exe" -ArgumentList "/download config.xml" -Wait

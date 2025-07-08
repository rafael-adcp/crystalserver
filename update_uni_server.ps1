# 🛠️ CONFIGURE THESE PATHS BEFORE RUNNING
$oldPath = "C:\UniServerZ"
$newPath = "C:\UniServerZ_New"
$installerPath = "$env:TEMP\UniServer_15_0_2.exe"
$downloadUrl = "https://downloads.sourceforge.net/project/miniserver/Uniform%20Server%20ZeroXV/15_0_2_ZeroXV.exe"

Write-Host "⬇️  Baixando Uniform Server mais recente..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

Write-Host "📦 Extraindo para $newPath..."
Start-Process -FilePath $installerPath -ArgumentList "/S /D=$newPath" -Wait

Write-Host "📁 Copiando www e userdata do servidor antigo..."
Copy-Item -Path "$oldPath\www" -Destination "$newPath\www" -Recurse -Force
Copy-Item -Path "$oldPath\userdata" -Destination "$newPath\userdata" -Recurse -Force

Write-Host "♻️ Renomeando UniServer antigo..."
Rename-Item -Path $oldPath -NewName "${oldPath}_Backup"

Write-Host "🚀 Ativando nova versão do UniServer..."
Rename-Item -Path $newPath -NewName $oldPath

Write-Host "✅ Atualização concluída! Você pode iniciar o UniController.exe normalmente."
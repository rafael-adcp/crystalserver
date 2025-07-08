# Caminho base do Visual Studio (ajuste se necessário)
$vsPath = "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC"
$dllName = "clang_rt.asan_dynamic-x86_64.dll"

# Procura a DLL dentro das versões instaladas
$asanPath = Get-ChildItem -Path "$vsPath" -Directory |
    ForEach-Object {
        Join-Path $_.FullName "bin\Hostx64\x64\$dllName"
    } |
    Where-Object { Test-Path $_ } |
    Select-Object -First 1

if ($asanPath) {
    # Caminho de destino (ajuste conforme necessário)
    $destPath = "C:\Users\Rafael Prado\Desktop\repos\ot_server_global_15\crystalserver"

    Copy-Item -Path $asanPath -Destination $destPath -Force
    Write-Host "✅ DLL copiada com sucesso para $destPath"
} else {
    Write-Host "❌ Não foi possível localizar $dllName. Verifique se o Visual Studio está instalado corretamente."
}
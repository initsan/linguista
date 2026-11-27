param(
    [Parameter(Mandatory = $true)]
    [string]$Path,
    [int]$Port = 8765
)

$full = (Resolve-Path -LiteralPath $Path).Path
$extension = [IO.Path]::GetExtension($full).ToLowerInvariant()
$contentType = switch ($extension) {
    '.png' { 'image/png' }
    '.jpg' { 'image/jpeg' }
    '.jpeg' { 'image/jpeg' }
    '.webp' { 'image/webp' }
    '.gif' { 'image/gif' }
    default { 'application/octet-stream' }
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://127.0.0.1:$Port/")
$listener.Start()
try {
    while ($true) {
        $context = $listener.GetContext()
        $response = $context.Response
        $response.Headers.Add('Access-Control-Allow-Origin', '*')
        if ($context.Request.HttpMethod -eq 'OPTIONS') {
            $response.Headers.Add('Access-Control-Allow-Methods', 'GET, OPTIONS')
            $response.Headers.Add('Access-Control-Allow-Headers', '*')
            $response.StatusCode = 204
            $response.Close()
            continue
        }
        $bytes = [IO.File]::ReadAllBytes($full)
        $response.ContentType = $contentType
        $response.ContentLength64 = $bytes.Length
        $response.OutputStream.Write($bytes, 0, $bytes.Length)
        $response.Close()
        break
    }
}
finally {
    $listener.Stop()
}

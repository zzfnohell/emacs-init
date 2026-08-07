# Windows GNU GLOBAL environment bootstrap (Scoop).
# Run once in PowerShell (user-level, no admin required):
#   powershell -ExecutionPolicy Bypass -File misc/windows-gtags-env.ps1
#
# What it does:
#   - Locates Scoop installs of global + universal-ctags
#   - Copies this repo's misc/gtags.conf to %USERPROFILE%\.globalrc
#   - Sets GTAGSLABEL=new-ctags
#   - Creates GTAGSOBJDIRPREFIX cache directory

$ErrorActionPreference = 'Stop'

function Find-ScoopRoot {
    foreach ($root in @('C:\Scoop', 'D:\Scoop', "$env:USERPROFILE\scoop")) {
        if (Test-Path $root) { return $root }
    }
    throw 'Scoop root not found (tried C:\Scoop, D:\Scoop, %USERPROFILE%\scoop).'
}

$scoop = Find-ScoopRoot
$globalBin = Join-Path $scoop 'apps\global\current'
$ctagsBin = Join-Path $scoop 'apps\universal-ctags\current\ctags.exe'

if (-not (Test-Path (Join-Path $globalBin 'bin\global.exe')) -and
    -not (Test-Path (Join-Path $globalBin 'global.exe'))) {
    Write-Warning "GNU Global not found under $globalBin — run: scoop install global"
}

if (-not (Test-Path $ctagsBin)) {
    Write-Warning "universal-ctags not found — run: scoop install universal-ctags"
}

# This script lives in <repo>/misc/
$repoMisc = $PSScriptRoot
$gtagsConf = Join-Path $repoMisc 'gtags.conf'
if (-not (Test-Path $gtagsConf)) {
    throw "Missing $gtagsConf"
}

$globalrc = Join-Path $env:USERPROFILE '.globalrc'
Copy-Item -Force $gtagsConf $globalrc
Write-Host "Installed user config: $globalrc"

$cache = 'C:\cache\gtagsdb'
New-Item -ItemType Directory -Force -Path $cache | Out-Null

[Environment]::SetEnvironmentVariable('GTAGSCONF', $globalrc, 'User')
[Environment]::SetEnvironmentVariable('GTAGSLABEL', 'new-ctags', 'User')
[Environment]::SetEnvironmentVariable('GTAGSOBJDIRPREFIX', $cache, 'User')

# Current session too
$env:GTAGSCONF = $globalrc
$env:GTAGSLABEL = 'new-ctags'
$env:GTAGSOBJDIRPREFIX = $cache

Write-Host @"
Done.
  GTAGSCONF=$globalrc
  GTAGSLABEL=new-ctags
  GTAGSOBJDIRPREFIX=$cache

Open a new terminal (or restart Emacs) so user env vars are visible.
Index a project:
  cd C:\src\your-app
  gtags
Query:
  global -x main
"@

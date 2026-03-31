param(
  [Parameter(Mandatory = $true)]
  [string]$DeployHost,

  [Parameter(Mandatory = $true)]
  [string]$DeployUser,

  [Parameter(Mandatory = $true)]
  [string]$DeployPath,

  [int]$DeployPort = 22,

  [ValidateSet("scp", "rsync")]
  [string]$DeployMethod = "scp"
)

$ErrorActionPreference = "Stop"

function Require-Command {
  param([string]$Name)
  if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
    throw "Required command '$Name' is not available in PATH."
  }
}

Write-Host "Installing dependencies and building..."
npm ci
npm run build

$distPath = ".vitepress/dist"
if (-not (Test-Path $distPath)) {
  throw "Build output not found: $distPath"
}

Require-Command "ssh"

if ($DeployMethod -eq "rsync") {
  Require-Command "rsync"
  Write-Host "Deploying with rsync to $DeployUser@$DeployHost:$DeployPath"
  & rsync -avz --delete -e "ssh -p $DeployPort" "$distPath/" "${DeployUser}@${DeployHost}:$DeployPath/"
}
else {
  Require-Command "scp"
  Write-Host "Preparing remote directory..."
  & ssh -p $DeployPort "${DeployUser}@${DeployHost}" "mkdir -p '$DeployPath'"
  Write-Host "Deploying with scp to $DeployUser@$DeployHost:$DeployPath"
  & scp -P $DeployPort -r "$distPath/." "${DeployUser}@${DeployHost}:$DeployPath/"
}

Write-Host "Deploy completed."

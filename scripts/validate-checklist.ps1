# Validates workflow checklist markdown structure.
#
# Usage:
#   pwsh ./scripts/validate-checklist.ps1
#
# Example OK output:
#   OK: checklist structure looks good (12 items).
#
# Example FAIL output:
#   FAIL: missing headings:
#     - ## Pairing (real collaborators only)
#
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$checklist = Join-Path $root "checklists\workflow.md"

if (-not (Test-Path $checklist)) {
    Write-Error "Missing checklist: $checklist"
    exit 1
}

$content = Get-Content -Path $checklist -Raw
$requiredHeadings = @(
    "## Opening an issue",
    "## Creating a pull request",
    "## Merging",
    "## Pairing (real collaborators only)"
)

$missing = @()
foreach ($heading in $requiredHeadings) {
    if ($content -notlike "*$heading*") {
        $missing += $heading
    }
}

$checkboxCount = ([regex]::Matches($content, "(?m)^- \[ \] ")).Count

if ($missing.Count -gt 0) {
    Write-Host "FAIL: missing headings:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host "  - $_" }
    exit 1
}

if ($checkboxCount -lt 8) {
    Write-Host "FAIL: expected at least 8 unchecked checklist items, found $checkboxCount" -ForegroundColor Red
    exit 1
}

Write-Host "OK: checklist structure looks good ($checkboxCount items)." -ForegroundColor Green
exit 0


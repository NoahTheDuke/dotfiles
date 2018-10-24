$STATUS = 0

$words = "fdescribe", "fcontext", "fit", "fspecify", "fexample"

ForEach ($focus in $words) {
    $diff = (git diff --staged | rg "^\+\s*$focus\(?" | Measure-Object -Line).Lines
    if ($diff -gt 0) {
        Write-Host "You forgot to remove a '$focus' in the following files:"
        git diff --staged --name-only -G"^\s*$focus\(?"
        Write-Host ""
        $STATUS = 1
    }
}

exit $STATUS

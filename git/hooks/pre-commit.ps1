# This pre-commit hook looks for `fdescribe`, `fcontext`, `fit`, `fspecify` and `fexample` in the
# staged files and exits with an error code of 1 if there are such changes.
#

$STATUS = 0

$words = "fdescribe", "fcontext", "fit", "fspecify", "fexample"

ForEach ($focus in $words) {
    $diff = (git diff --staged | rg "^\+\s*$focus\(" | Measure-Object -Line).Lines
    if ($diff -gt 0) {
        Write-Host "You forgot to remove a '$focus' in the following files:"
        git diff --staged --name-only -G"^\s*$focus\("
        Write-Host ""
        $STATUS = 1
    }
}

exit $STATUS

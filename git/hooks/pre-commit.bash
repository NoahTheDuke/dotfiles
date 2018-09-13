STATUS=0

for focus in fdescribe fcontext fit fspecify fexample; do
    if [ $(git diff --staged | rg "^\+\s*$focus\(") ]
    then
        echo "You forgot to remove a $focus in the following files:"
        git diff --staged --name-only -G"^\s*$focus\("
        echo ""
        STATUS=1
    fi
done

exit $STATUS

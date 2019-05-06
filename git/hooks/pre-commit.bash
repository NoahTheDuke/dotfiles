STATUS=0

for item in fdescribe fcontext fit fspecify fexample focus; do
    if [ -n "`git diff --staged | rg "^\+\s*$item\("`" ]
    then
        echo "You forgot to remove a $item in the following files:"
        git diff --staged --name-only -G"^\+?\s*$item\("
        STATUS=1
    fi
done

exit $STATUS

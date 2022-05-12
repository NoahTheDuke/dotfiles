for item in fdescribe fcontext fit fspecify fexample focus; do
    if [ -n "`git diff --staged | rg "^\+\s*$item\("`" ]
    then
        echo "'$item' in:"
        git diff --staged --name-only -G"^\+?\s*$item\("
    fi
done

# local matches=$(git diff --staged --name-only | xargs rg "\s+$" -l --color never --)
# if [ -n "$matches" ]; then
#     echo "trailing whitespace in:"
#     echo $matches | tr " " "\n"
# fi

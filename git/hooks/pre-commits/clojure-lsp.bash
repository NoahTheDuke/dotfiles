if command -v clojure-lsp 2>&1 >/dev/null
then
    result=$(bash -c 'clojure-lsp diagnostics' 2>&1)
    resultCode=$?
    if [ $resultCode -ne 0 ]
    then
        echo "$result"
    fi
fi

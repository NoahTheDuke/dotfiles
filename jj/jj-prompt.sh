# taken from https://github.com/jj-vcs/jj/wiki/Shell-Prompt
#
# put this in ~/.bashrc
# source ~/dotfiles/jj/jj-prompt.sh
# PS1='\[\e[32m\]\u@\h \[\e[33m\]\w \[\e[0m\]\[\e[1;34m\]\[\e[0m\]\n$(jjgit_prompt)'

jjgit_prompt() {
    # echo "jj" or "git" if either is found in $PWD or its parent directories
    # using the shell is much faster than `git rev-parse --git-dir` or `jj root`
    pwd_in_jjgit() {
        local D="/$PWD"
        while test -n "$D" ; do
            test -e "$D/.jj" && { echo jj ; return; }
            test -e "$D/.git" && { echo git ; return; }
            D="${D%/*}"
        done
    }
    local jjgit="`pwd_in_jjgit`"  # results in "jj", "git" or ""
    if test "$jjgit" = jj ; then
        # --ignore-working-copy: avoid inspecting $PWD and concurrent snapshotting which could create divergent commits
        jj --ignore-working-copy --no-pager log --no-graph --color=always -r @ \
            -T ' "jj:[@ " ++ concat( separate(" ", format_short_change_id_with_hidden_and_divergent_info(self), format_short_commit_id(commit_id), bookmarks, if(conflict, label("conflict", "conflict")) ) ) ++ "]\n" ' 2>/dev/null
    elif test "$jjgit" = git ; then
        # --no-pager: never use a pager for the prompt, regardless of user config
        local gitprompt=$(git --no-pager log -1 --color=always --pretty='%C(auto)%h ꜓%C(auto)%(decorate:prefix=,suffix=,tag=,pointer=→,separator=%x2C )' 2>/dev/null)
        echo "git:[${gitprompt/HEAD/}]"
    fi
    echo "$ "
}

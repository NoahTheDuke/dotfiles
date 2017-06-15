dotfiles
========

A repository for all of my dotfiles!

Powershell
==========

Move the DraculaPowerShell folder to the Powershell Modules folder, then run:

    Import-Module DraculaPowerShell
    New-DraculaPowerShell "Dracula PowerShell"

This will create a powershell file with the changes applied. Use that as the link for all powershell uses.

Vim
=====

Because I use [literate-vimrc](https://github.com/thcipriani/literate-vimrc), `~/.vimrc` needs to say:
```viml
execute literatevimrc#load('~/dotfiles/vim/.vimrc.md')
```
and `vim/autoload/` needs to be moved to `~/.vim` or `~/vimfiles` (Unix or Windows, respectively). After it loads once,
type `:PlugInstall`, and then copy the new `~/.vim/plugged/literate-vimrc/autoload/literatevimrc.vim` to
`~/(.vim/vimfiles)/autoload` to use the most up-to-date version of literate-vimrc.

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

`vim/autoload/` needs to be moved to `~/.vim` or `~/vimfiles` (Unix or Windows, respectively). After it loads once,
type `:PlugInstall`.

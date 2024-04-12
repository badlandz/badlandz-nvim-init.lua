# NoLua.vim may contain LUA

This is my old init.vim file before trying to convert to lua. I am keeping it here because it's functional for me for vimwiki and time tracking on projects and tasks with vimtask, timewarrior, taskwarrior, and related tools I have been using for a few years.

HOWEVER: telescope is broken, leader key is "\"

There are many requirements for setup, and the documentation for setup can be found by the plugin maintainers. I will provide more information when I have time.

## Test Area

* [ ] This is task 1  #3c2b4e5f
* [ ] This is task 2:  #52185992
		* [ ] Do this before task 2  #58fe4423

This links to a [New README](new/README.md)

# BUGS

## NIXOS
Ok, not working in my nix build because I don't have python installed... the test below seemed to show, I don't have python on that box.
```
nvim -u ~/github/badlandz/nolua.vim/init.vim README.md
pip3 install tasklib pynvim tasklib vimwiki
which python
```

## VIM
This thing still is a neovim init, even if it's not lua, it chokes in regular "vim" instead of nvim. Need to clean this up if I can, make it tighter.

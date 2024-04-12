# NoLua.vim may contain LUA

ignore me: [Bumper Pool](/)

## About

Works in vim, and neovim both. Just "this feature not available" error in vim for stuff like telescope. But, it's 100 lines or less, and will work with both editors.
![Screenshot from 2024-04-11 22-08-43](https://github.com/badlandz/nolua.vim/assets/30945171/9ed05166-d4e7-48a8-ab6a-2a2fd13234f3)

This is my old init.vim file before trying to convert to lua. I am keeping it here because it's functional for me for vimwiki and time tracking on projects and tasks with vimtask, timewarrior, taskwarrior, and related tools I have been using for a few years.

## Installation Guide

There is no guide right now, just the init.vim file and documetation about how to start using it, there are dependancies, and they should be documented, I'll try, at some point. For now, this is working:

![Screenshot from 2024-04-11 21-28-10](https://github.com/badlandz/nolua.vim/assets/30945171/e888625b-662d-4dd1-a3bd-c6029f480e52)
There are many requirements for setup, and the documentation for setup can be found by the plugin maintainers. I will provide more information when I have time.

# Roadmap

When I have time I would like to make this a 100 line or less init.vim without lua that creates a nice RUST IDE in vim (not neovim, to stay quick on small older systems).

## Test Area

This area can be edited and played with in vim, to make sure the plugins are working:

* [S] This is task 1  #6ef6b5fa
* [ ] This is task 2  #3625486d
		* [ ] Do this before task 2  #10f58606
		### Format Issue displaying in GitHub

This links to a [New README](new/README.md) created using the editor, you will create one on your system when you use it.


# BUGS

There is no install guide, and .. like.. it's not even flaky yet... 

## NIXOS
Ok, not working in my nix build because I don't have python installed... the test below seemed to show, I don't have python on that box. Just a reminder to me that I need to document some of the prerequisites of this for each OS
```
nvim -u ~/github/badlandz/nolua.vim/init.vim README.md
pip3 install tasklib pynvim tasklib vimwiki
which python
```

# NoLua.vim may contain LUA

This is my old init.vim file before trying to convert to lua. I am keeping it here because it's functional for me for vimwiki and time tracking on projects and tasks with vimtask, timewarrior, taskwarrior, and related tools I have been using for a few years.

HOWEVER: telescope is broken, leader key is "\"

There are many requirements for setup, and the documentation for setup can be found by the plugin maintainers. I will provide more information when I have time.

## Test Area

* [ ] This is task 1  #6ef6b5fa
* [ ] This is task 2:  #3625486d
		* [ ] Do this before task 2  #10f58606

This links to a [New README](new/README.md)

# BUGS

## Mint Linux

I use to be able to run:
```
\fg
```
Which is my leaderkey "\" that I should remap, but, ...
It use to give me some funky fuzzy-grep search thing I used a lot, now it just spills out errors:
```
                                                                                                                            
E5108: Error executing lua ...te/.vim/plugged/telescope.nvim/lua/telescope/pickers.lua:347: Invalid 'event': 'User Telescope
FindPre'                                                                                                                    
stack traceback:                                                                                                            
        [C]: in function 'nvim_exec_autocmds'                                                                               
        ...te/.vim/plugged/telescope.nvim/lua/telescope/pickers.lua:347: in function 'find'                                 
        ...plugged/telescope.nvim/lua/telescope/builtin/__files.lua:126: in function 'v'                                    
        ...plugged/telescope.nvim/lua/telescope/builtin/__files.lua:529: in function 'v'                                    
        ...im/plugged/telescope.nvim/lua/telescope/builtin/init.lua:514: in function 'live_grep'                            
        [string ":lua"]:1: in main chunk                                                                                    
Press ENTER or type command to continue        
```

## NIXOS
Ok, not working in my nix build because I don't have python installed... the test below seemed to show, I don't have python on that box.
```
nvim -u ~/github/badlandz/nolua.vim/init.vim README.md
pip3 install tasklib pynvim tasklib vimwiki
which python
```

## VIM
This thing still is a neovim init, even if it's not lua, it chokes in regular "vim" instead of nvim. Need to clean this up if I can, make it tighter.

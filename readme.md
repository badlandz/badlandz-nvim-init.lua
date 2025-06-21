# Ollama Task Wiki

Requires:
* TaskWiki
* TaskWarrior
* TimeWarrior
* VimWiki


This is an "outline" and "project" not yet fully functional.

# nolua.vim - Neovim Configuration

This repository contains my personal Neovim configuration, designed for productivity with a focus on Markdown, VimWiki, and AI integration via Ollama.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Plugins](#plugins)
- [Keybindings](#keybindings)
- [VimWiki and TaskWiki Configuration](#vimwiki-and-taskwiki-configuration)
- [AI Integration (gen.nvim)](#ai-integration-gennvim)
- [Colorscheme and Appearance](#colorscheme-and-appearance)

## Features

* [cite_start]**Plugin Management**: Uses `lazy.nvim` for efficient plugin loading and management.
* [cite_start]**Core Editing**: Basic Neovim settings for improved editing experience (e.g., relative line numbers, tab settings).
* [cite_start]**File Navigation**: `NERDTree` for file system exploration.
* [cite_start]**Fuzzy Finding**: `telescope.nvim` for fast file searching, grepping, and buffer switching.
* [cite_start]**Markdown & Wiki**: Comprehensive support for Markdown, VimWiki, and TaskWiki for note-taking and task management.
* [cite_start]**AI Integration**: Utilizes `gen.nvim` to interact with Ollama models, including a custom command for merging texts.
* [cite_start]**Git Integration**: `vim-fugitive` for seamless Git operations within Neovim.
* [cite_start]**Status Line**: `vim-airline` for an informative and customizable status line.
* [cite_start]**Syntax Highlighting**: Enhanced syntax highlighting with `nvim-treesitter`.
* [cite_start]**GUI Enhancements**: Neovide-specific settings for transparency and font.

## Installation

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/badlandz/nolua.vim](https://github.com/badlandz/nolua.vim) ~/.config/nvim
    ```
2.  **Ensure you have Ollama installed and a model pulled**:
    The AI integration uses `llama3.1` by default. You can pull it using:
    ```bash
    ollama pull llama3.1
    ```
    (Adjust the model name in `ai.lua` if you prefer a different one.)
3.  **Open Neovim**:
    ```bash
    nvim
    ```
    `lazy.nvim` will automatically bootstrap itself and install all specified plugins on the first launch.

## Plugins

This configuration uses `lazy.nvim` to manage the following plugins:

| Plugin Name                  | Description                                                                     | Source        |
| :--------------------------- | :------------------------------------------------------------------------------ | :------------ |
| `folke/tokyonight.nvim`      | A dark Neovim colorscheme. [cite_start](Though `industry` is set as default)                |      |
| `morhetz/gruvbox`            | Another popular Neovim colorscheme.                                             [cite_start]|      |
| `preservim/nerdtree`         | A file system explorer for Vim/Neovim.                                          [cite_start]|      |
| `vim-airline/vim-airline`    | A lean & mean status/tabline for Vim that's light and fast.                     [cite_start]|      |
| `vim-airline/vim-airline-themes` | Themes for vim-airline.                                                         [cite_start]|      |
| `vimwiki/vimwiki`            | Personal wiki for Vim.                                                          [cite_start]|      |
| `tbabej/taskwiki`            | Task management extension for Vimwiki.                                          [cite_start]|      |
| `farseer90718/vim-taskwarrior` | Integration with Taskwarrior CLI.                                               [cite_start]|      |
| `plasticboy/vim-markdown`    | Markdown syntax highlighting and tools.                                         [cite_start]|      |
| `powerman/vim-plugin-AnsiEsc`| ANSI escape sequences support for Vim.                                          [cite_start]|      |
| `majutsushi/tagbar`          | A Vim plugin for Browse the tags of the current file.                         [cite_start]|      |
| `tpope/vim-fugitive`         | A Git wrapper for Vim.                                                          [cite_start]|      |
| `cormacrelf/vim-colors-github` | GitHub-like colorscheme for Vim.                                                [cite_start]|      |
| `sonph/onehalf`              | A color palette for editors and terminals.                                      [cite_start]|      |
| `nvim-treesitter/nvim-treesitter` | Neovim treesitter configuration for advanced syntax highlighting.           [cite_start]|      |
| `nvim-lua/plenary.nvim`      | Common Lua functions for Neovim plugins.                                        [cite_start]|      |
| `nvim-telescope/telescope.nvim` | A highly extensible fuzzy finder.                                               [cite_start]|      |
| `xiyaowong/transparent.nvim` | Plugin for transparent backgrounds.                                             [cite_start]|      |
| `David-Kunz/gen.nvim`        | Integration with Large Language Models (LLMs) like Ollama.                      [cite_start]|   |

## Keybindings

[cite_start]The leader key is set to `<Space>`.

| Keybinding          | Description                                    | Plugin/Function         |
| :------------------ | :--------------------------------------------- | :---------------------- |
| `<leader>ff`        | Find files (fuzzy search).                     | Telescope               |
| `<leader>fg`        | Live grep (search content in files).           | Telescope               |
| `<leader>fb`        | List and switch between open buffers.          | Telescope               |
| `<leader>fh`        | Search help tags.                              | Telescope               |
| `<C-f>`             | Toggle NERDTree file explorer.                 | NERDTree                |
| `<C-l>`             | Toggle TaskWiki.                               | TaskWiki                |
| `<leader>gf`        | Git diffget //2 (merge conflict resolution).   | Fugitive                |
| `<leader>gj`        | Git diffget //3 (merge conflict resolution).   | Fugitive                |
| `<leader>gs`        | Open Git status window.                        | Fugitive                |

## VimWiki and TaskWiki Configuration

* [cite_start]**VimWiki Base Directory**: Your wiki files are located in `~/doc/`.
* [cite_start]**Syntax**: Uses Markdown syntax with `.md`, `.markdown`, and `.mdown` extensions.
* [cite_start]**Link Handling**: Markdown links are configured to use extensions.
* [cite_start]**Folding**: Folding is disabled for VimWiki files.
* [cite_start]**TaskWiki Markup**: TaskWiki also uses Markdown syntax.
* [cite_start]**Concealcursor**: `taskwiki_disable_concealcursor` is set to `nc`.

## AI Integration (gen.nvim)

[cite_start]The configuration integrates with `gen.nvim` for AI capabilities, utilizing Ollama.

* [cite_start]**Model**: Configured to use `llama3.1` from Ollama.
* [cite_start]**Display Mode**: AI responses are displayed in a floating window.
* [cite_start]**Custom Prompt**: A custom prompt named `Merge_Texts` is defined:
    `prompt = "Merge the following two texts, removing redundancies and preserving unique information:\n\n$text"` 
* **`WikiMerge` User Command**:
    * **Usage**: `:WikiMerge <file1> <file2>` 
    * **Functionality**: This command takes two file paths as arguments, reads their content, combines them into a new buffer, and then calls the `Gen Merge_Texts` command to have the AI merge the content. This is particularly useful for consolidating information from multiple wiki pages.

## Colorscheme and Appearance

* [cite_start]**Default Colorscheme**: `industry` is set as the primary colorscheme.
* [cite_start]**Transparent Background**: The `Normal` and `NonText` highlight groups are set to have a transparent background for both GUI and terminal environments.
* [cite_start]**Neovide Transparency**: For Neovide (GUI), transparency is set to `0.5` with a background color derived from `#0f1117` and a transparency of `0.8`.
* [cite_start]**GUI Font**: The GUI font is set to `CaskaydiaCove Nerd Font:h13`.
* [cite_start]**Airline Theme**: The `vim-airline` status line uses the `base16_gigavolt` theme and powerline fonts.

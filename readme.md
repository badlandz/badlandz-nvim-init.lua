# nolua.vim Summary

**nolua.vim** is a LUA Neovim configuration (I wanted to avoid it, but now I have to rename it) built on Linux Mint, optimized for English language editing (Markdown, LaTeX, VimWiki) with AI integration via Ollama and task/time management via TaskWiki. Maintained for years, it needs expert help to fix AI text merging and become a premier English prose editor.

## Key Features

- **Plugin Management**: Uses `lazy.nvim` for efficient plugin loading.
- **Core Editing**: Tailored for writing with relative line numbers, 2-space tabs, Markdown syntax, and no folding.
- **Task Management**: Integrates TaskWiki with TaskWarrior and TimeWarrior for task tracking and time logging, ideal for managing writing projects.
- **AI Integration**: Uses `gen.nvim` with Ollama’s `llama3.1` model for text merging via `:WikiMerge`, though currently broken for clean diffs and paragraph summaries.
- **File Navigation**: `NERDTree` for file exploration, `telescope.nvim` for fuzzy finding files and content.
- **VimWiki**: Markdown-based wiki in `~/doc/` with extension-aware links.
- **Git Support**: `vim-fugitive` for Git operations, including merge conflict resolution.
- **Appearance**: `industry` colorscheme, transparent backgrounds, and Neovide GUI with `CaskaydiaCove Nerd Font`.

## Prerequisites

Built and tested on **Linux Mint**, nolua.vim requires the following:

- **Neovim**: Version compatible with `lazy.nvim` (e.g., 0.9+ recommended).
- **TaskWiki**: For task and time management within VimWiki.
- **TaskWarrior**: CLI tool for task management.
- **TimeWarrior**: CLI tool for time tracking, integrated with TaskWiki.
- **VimWiki**: For Markdown-based note-taking and wiki management.
- **Ollama**: AI platform with the `llama3.1` model for text merging.
- **Git**: For cloning the repository and managing plugins.

## Project Goals

- **English Language Editor**: Transform Neovim into a top-tier editor for English prose, supporting Markdown and LaTeX workflows.
- **AI-Driven Merging**: Fix `:WikiMerge` to highlight and merge paragraphs, offering AI-generated summaries at sentence, paragraph, or page levels.
- **Time Tracking for Writers**: Enhance TaskWiki/TimeWarrior integration to track time spent on writing tasks, boosting productivity.
- **Community Collaboration**: Invite experts (e.g., ThePrimeagen, TJ DeVries) to refine nolua.vim at [https://github.com/badlandz/nolua.vim](https://github.com/badlandz/nolua.vim).

## Current Challenges

- **Broken AI Merging**: `:WikiMerge` finds similar documents but fails to produce clean diffs or suggest coherent paragraph summaries.
- **Lua Avoidance**: The project minimizes Lua scripting, relying on plugins, but may need Lua expertise for robust AI and merge functionality.

## Getting Started

1. **Install Neovim**:
   - Follow the official Neovim installation guide for Linux Mint: [https://github.com/neovim/neovim/blob/master/INSTALL.md](https://github.com/neovim/neovim/blob/master/INSTALL.md).
   - Example for Linux Mint:
     ```bash
     sudo apt update
     sudo apt install neovim
     ```

2. **Install Prerequisites**:
   - **TaskWarrior**: Install via:
     ```bash
     sudo apt install taskwarrior
     ```
     See [https://taskwarrior.org/docs/](https://taskwarrior.org/docs/) for setup.
   - **TimeWarrior**: Install via:
     ```bash
     sudo apt-get install timewarrior taskwarrior python3-tasklib
     ```
     See [https://timewarrior.net/docs/](https://timewarrior.net/docs/) for configuration.
   - **VimWiki**: Installed automatically via `lazy.nvim` (step 4).
   - **Ollama**: Install Ollama and pull the `llama3.1` model:
     ```bash
     curl https://ollama.ai/install.sh | sh
     ollama pull llama3.1
     ```
     See [https://ollama.ai/](https://ollama.ai/) for details.
   - **Git**: Ensure Git is installed:
     ```bash
     sudo apt install git
     ```

3. **Clone nolua.vim**:
   ```bash
   git clone https://github.com/badlandz/nolua.vim ~/.config/nvim

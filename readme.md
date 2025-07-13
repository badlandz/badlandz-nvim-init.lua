# Neovim Configuration for English Prose

## Summary

This is a **Neovim configuration** primarily set up for English language editing, focusing on Markdown and VimWiki workflows. It leverages `lazy.nvim` for plugin management and integrates tools for basic task management and Git. While future goals include advanced AI integration via Ollama for text merging and enhanced time tracking, these features are **not yet fully implemented** in the current configuration.

---

## Key Features

* **Plugin Management**: Uses `lazy.nvim` for efficient plugin loading and management.
* **Core Editing**: Configured for writing with settings like relative line numbers, 2-space tabs, Markdown syntax highlighting, and soft wrapping with indentation.
* **File Navigation**: Integrates `NERDTree` for file system exploration and `telescope.nvim` for fuzzy finding files and content.
* **VimWiki**: Provides a Markdown-based wiki system, configured to store notes in `~/doc/` with `.md` extensions and proper link handling.
* **TaskWiki Integration**: Includes basic setup for `taskwiki` to work with Markdown, enabling rudimentary task management within VimWiki. (Note: Full TaskWarrior/TimeWarrior integration and advanced features like time tracking for writers are part of future goals.)
* **Git Support**: `vim-fugitive` is included for basic Git operations and merge conflict resolution.
* **Appearance**: Uses the `industry` colorscheme, features transparent backgrounds for a modern look, and is configured for the Neovide GUI with `CaskaydiaCove Nerd Font`.
* **Markdown Preview**: Includes `markdown-preview.nvim` for live preview of Markdown files.
* **Writing Enhancements**: Utilizes `vim-pencil` for a better writing experience, including default soft word wrapping.

---

## Prerequisites

This configuration is built and tested on **Linux Mint** and requires the following to be installed on your system:

* **Neovim**: Version compatible with `lazy.nvim` (e.g., 0.9+ recommended).
* **Git**: For cloning the repository and managing plugins.
* **Node.js and npm**: Required by `markdown-preview.nvim` for its functionality.
* **CaskaydiaCove Nerd Font**: Recommended for optimal appearance with Neovide.

*The following tools are mentioned in the project goals but are not fully integrated or required for the current functionality of the provided `init.lua`:*
* **TaskWarrior**: CLI tool for task management.
* **TimeWarrior**: CLI tool for time tracking.
* **Ollama**: AI platform (for future AI integration).

---

## Project Goals (Future Development)

The long-term vision for this Neovim configuration includes:

* **English Language Editor**: Evolving into a top-tier editor for English prose, with robust support for Markdown and LaTeX workflows.
* **AI-Driven Merging**: Implementing `:WikiMerge` (likely via `gen.nvim` or similar) to highlight and merge paragraphs, offering AI-generated summaries at sentence, paragraph, of similar document, providing cites for source while summarizing, using models like Ollama's `llama3.1`.
* **Advanced Time Tracking for Writers**: Enhancing TaskWiki/TimeWarrior integration to seamlessly track time spent on writing tasks, boosting productivity and providing insights.
* **Community Collaboration**: Seeking contributions and expertise to refine and expand the capabilities of this configuration.

---

## Current Status and Challenges

* **AI Integration**: The AI-driven merging features outlined in the goals are **not yet implemented** in the current `init.lua`. The configuration does not include `gen.nvim` or any explicit Ollama integration.
* **TaskWiki Depth**: While `taskwiki` is included, advanced time tracking and deep integration with TaskWarrior/TimeWarrior are future enhancements, not current features.

---

## Getting Started

1.  **Install Neovim**:
    * Follow the official Neovim installation guide for Linux: [https://github.com/neovim/neovim/blob/master/INSTALL.md](https://github.com/neovim/neovim/blob/master/INSTALL.md).
    * Example for Linux Mint:
        ```bash
        sudo apt update
        sudo apt install neovim
        ```

2.  **Install Prerequisites**:
    * **Git**: Ensure Git is installed:
        ```bash
        sudo apt install git
        ```
    * **Node.js and npm**: Required for Markdown preview. Refer to official Node.js installation guides for your system.
    * **CaskaydiaCove Nerd Font**: Install this font on your system for the intended visual appearance.

3.  **Clone this configuration**:
    ```bash
    git clone https://github.com/badlandz/nolua.vim
    ```
    (Note: The repository name `nolua.vim` refers to this Neovim configuration.)

4.  **Launch Neovim**:
    * Open Neovim by running `nvim` in your terminal. `lazy.nvim` will automatically install the specified plugins on the first launch.


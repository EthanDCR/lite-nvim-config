
local fn = vim.fn 
local ensure_packer = function()
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end  -- This 'end' was missing!

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    -- use "projekt0n/github-nvim-theme"  -- Commented out or remove this line
    use "nvim-tree/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-neotest/nvim-nio"
    use "nvim-lua/plenary.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = {
            "debugloop/telescope-undo.nvim"
        },
    }
    use "lewis6991/gitsigns.nvim"
    use "romgrk/barbar.nvim"
    use "eoh-bse/minintro.nvim"
    use "stevearc/oil.nvim"
    use "NvChad/nvterm"
    use "github/copilot.vim"
    use "folke/which-key.nvim"
    use "folke/twilight.nvim"
    use "folke/zen-mode.nvim"
    use "folke/todo-comments.nvim"
    use "folke/lsp-colors.nvim"
    use "folke/trouble.nvim"
    use "rmagatti/auto-session"
    use "numToStr/Comment.nvim"
    use "kylechui/nvim-surround"
    use "mg979/vim-visual-multi"

    use {
        "neoclide/coc.nvim",
        branch = "release",
    }

    use {
        "mfussenegger/nvim-dap",
        requires = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui"
        }
    }
    -- NodeJS Debug Adapter
    use "mxsdev/nvim-dap-vscode-js"
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "yarn install --ignore-optional ; npx gulp vsDebugServerBundle ; mv dist out"
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end  -- This closes the if statement
end)  -- This closes the packer.startup function

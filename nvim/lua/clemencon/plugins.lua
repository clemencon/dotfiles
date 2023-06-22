local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require ('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'solid' })
        end,
    },
})

local use = require('packer').use

-- Packer can manage itself.
use('wbthomason/packer.nvim')

-- Automatically set the working directory to the project root when opening a project.
use({
  'airblade/vim-rooter',
  setup = function()
    vim.g.rooter_manual_only = 1 -- Start Rooter in manual mode.
  end,
  config = function()
    vim.cmd('Rooter') -- Start Rooter when the plugin is loaded.
  end,
})

-- Set the colorscheme.
use({
  'rose-pine/neovim', as = 'rose-pine',
  config = function()
    vim.cmd('colorscheme rose-pine')

    -- Hide the characters in FloatBorder.
    vim.api.nvim_set_hl(0, 'FloatBorder', {
      fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
    })

    -- Make the StatusLineNonText background the same as StatusLine.
    vim.api.nvim_set_hl(0, 'StatusLineNonText', {
      fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
      bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
    })

    -- Hide the characters in CursorLineBg.
    vim.api.nvim_set_hl(0, 'CursorLineBg', {
      fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
      bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
    })
  end,
})

-- Commenting support.
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text.
-- use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite
-- use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b.
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support.
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands.
-- use('tpope/vim-repeat')

-- Add more languages.
use('sheerun/vim-polyglot')

-- Navigate seemlessly between Vim windows and Tmux panes.
-- use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text.
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes.
-- use({
    -- 'whatyouhide/vim-textobj-xmlattr',
    -- requires = 'kana/vim-textobj-user'
-- })

-- Automatically add closing brackets, quotes, etc.
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- Add smooth scrolling to avoid jarring jumps.
use({
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup()
  end,
})

-- Close buffers without closing the split window.
use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

-- Split arrays and methods onto multiple lines, or join them back up.
-- use({
  -- 'AndrewRadev/splitjoin.vim',
  -- config = function()
    -- vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    -- vim.g.splitjoin_trailing_comma = 1
    -- vim.g.splitjoin_php_method_chain_full = 1
  -- end,
-- })

-- Automatically fix indentation when pasting code.
use({
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = {'fugitive'}
    end,
})

-- Telescope fuzzy finder.
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('clemencon/plugins/telescope')
  end,
})

-- File tree side bar.
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('clemencon/plugins/nvim-tree')
  end,
})

-- A status line.
use({
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('clemencon/plugins/lualine')
  end,
})

-- Buffer line.
use({
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  after = 'rose-pine',
  config = function()
    require('clemencon/plugins/bufferline')
  end,
})

-- Display indentation lines.
use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('clemencon.plugins.indent-blankline')
  end,
})

-- Git integration.
use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
  end,
})

--- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
    vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
    vim.cmd([[
      highlight link Floaterm CursorLine
      highlight link FloatermBorder CursorLineBg
    ]])
  end
})

-- Git commands.
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
})

-- Improved syntax highlighting.
use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    config = function()
      require('clemencon.plugins.treesitter')
    end
}

-- Language Server Protocol.
use {
    "neovim/nvim-lspconfig",
    requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'b0o/schemastore.nvim',
    },
    config = function()
      require('clemencon.plugins.lspconfig')
    end
}

-- Autocompletion.
-- use({
--   'hrsh7th/nvim-cmp',
--   requires = {
--     'hrsh7th/cmp-nvim-lsp',
--     'hrsh7th/cmp-nvim-lsp-signature-help',
--     'hrsh7th/cmp-buffer',
--     'hrsh7th/cmp-path',
--     'L3MON4D3/LuaSnip',
--     'saadparwaiz1/cmp_luasnip',
--     'onsails/lspkind-nvim',
--   },
--   config = function()
--     require('clemencon/plugins/cmp')
--   end,
-- })

use('github/copilot.vim')

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

-- Automatically run :PackerCompile whenever plugins.lua is updated.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])


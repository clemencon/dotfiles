# Check the options using :help <option> eg :help breakindent

vim.opt.backupdir:remove('.') -- Keep backups out of the current directory.
vim.opt.breakindent = true -- Maintain indent when wrapping indented lines.
vim.opt.clipboard = 'unnamedplus' -- Use macOS system clipboard.
vim.opt.confirm = true -- Ask for confirmation instead of erroring.
vim.opt.expandtab = true
vim.opt.fillchars:append({ eob = ' ' }) -- Remove the ~ from end of buffer.
vim.opt.ignorecase = true
vim.opt.list = true -- Enable the listchars.
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.mouse = 'a' -- Enable mouse for all modes.
vim.opt.number = true
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files.
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.shortmess:append({ I = true }) -- Disable the splash screen.
vim.opt.showmode = false -- The mode is already shown via the buffer line.
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes:2'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.spell = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.undofile = true -- Persistent undo.
vim.opt.updatetime = 4001 -- Set updatime to 1ms longer than the default to prevent polyglot from changing it.
vim.opt.wildmode = 'longest:full,full' -- Complete the longest common match, and allow tabbing the results to fully complete them.
vim.opt.wrap = false

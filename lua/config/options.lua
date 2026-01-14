-- UI and Formatting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true -- highlight the current line
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 18 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 10 -- minimal number of screen columns to keep to the left and right (horizontal) of the cursor if wrap is `false`
vim.opt.wrap = false -- display a long line
vim.opt.colorcolumn = "120"

-- Indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 4 -- when hitting <BS>, pretend like a tab is removed, even if spaces
vim.opt.tabstop = 4
vim.opt.shiftround = false -- use multiple of shiftwidth when indenting with "<" and ">"

-- Search
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case
vim.opt.wildignore = vim.opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*" }

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- allow neovim to access the system clipboard

-- Undo and Backups
vim.opt.undofile = true -- enable persistent undo
vim.opt.backup = false -- create a backup file
vim.opt.swapfile = false -- creates a swapfile
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Special Characters
vim.opt.list = true
vim.opt.listchars = { tab = "┊ ", trail = "·", extends = "»", precedes = "«", nbsp = "×" }
vim.opt.matchpairs:append("<:>") -- Add angle brackets to % matching

-- Splits
vim.opt.splitbelow = true -- open new split below
vim.opt.splitright = true -- open new split to the right

-- Globals
vim.g.have_nerd_font = true

-- Removes command line from bottom except when recording macro.
vim.opt.cmdheight = 0
vim.cmd([[ autocmd RecordingLeave * set cmdheight=0 ]])
vim.cmd([[ autocmd RecordingEnter * set cmdheight=1 ]])

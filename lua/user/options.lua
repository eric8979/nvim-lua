local options = {
  backup = false,                          -- create a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  fileencoding = "utf-8",                  -- the encoding written to a file
  mouse = "n",                             -- allow the mouse to be used in normal mode
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  hlsearch = true,                         -- highlight all matches on previous search pattern
  showmode = true,                         -- show -- INSERT --
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case (for searching)
  smartindent = true,                      -- e.g. indenting for {, }
  splitright = true,                       -- force all vertical splits to the right of the current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1500,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  expandtab = true,                        -- convert tabs to spaces
  cursorline = false,                      -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  wrap = false,                            -- display lines as one long line
  scrolloff = 15,                          -- minimum lines at the top/bottom
  sidescrolloff = 10,
  -- ?
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  undofile = true,                         -- enable persistent undo
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  swapfile = false,                        -- creates a swapfile
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  conceallevel = 0,                        -- `` is visible in markdown files
  pumheight = 10,                          -- pop up menu height
}

-- ?
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

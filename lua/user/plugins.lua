local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- packer.init {
  -- display = {
    -- open_fn = function()
      -- return require("packer.util").float { border = "rounded" }
    -- end,
  -- },
-- }

-- Install your plugins here
return packer.startup(function(use)

  -- Packer can manage itself
  use { "wbthomason/packer.nvim", commit="00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" } 
  -- Useful lua functions used by lots of plugins
  use { "nvim-lua/plenary.nvim", commit="968a4b9afec0c633bc369662e78f8c5db0eba249" }
  use {"ms-jpq/coq_nvim", commit="cbbd564a27755ab3a87e0440b5559c44498c7e1a" }
  use {"jiangmiao/auto-pairs", commit="39f06b873a8449af8ff6a3eee716d3da14d63a76"}
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use({"NLKNguyen/papercolor-theme"})
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


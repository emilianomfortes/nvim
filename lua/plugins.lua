local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

----------------------------------------------------------------------------
-- Install your plugins here

vim.g.material_style = "deep ocean"

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Markdown
  use {"ellisonleao/glow.nvim"} -- Markdown integration with glow in nvim
    
  use 'nvim-treesitter/nvim-treesitter' -- Treesitter


  -- COLORSCHEMES  
  use {'frenzyexists/aquarium-vim', config = function() vim.cmd 'colorscheme aquarium' end}

  -- use {'ishan9299/modus-theme-vim', config = function() vim.cmd 'colorscheme modus-vivendi' end}
  -- use {'marko-cerovac/material.nvim', config = function() vim.cmd 'colorscheme material' end}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)



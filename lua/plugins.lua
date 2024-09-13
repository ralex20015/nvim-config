require('packer').startup(function()
  use 'wbthomason/packer.nvim'  -- Packer puede gestionar itself
  use 'neovim/nvim-lspconfig'   -- Plugin para LSP
  use 'morhetz/gruvbox'
  use 'ThePrimeagen/vim-be-good'
  use 'mhartington/formatter.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
end)

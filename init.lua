local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.mkdir(vim.fn.stdpath("data") .. "/lazy", "p")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypth
	})
end
vim.opt.rtp:prepend(lazypath)
require('plugins')

require('lsp')

vim.cmd[[colorscheme gruvbox]]

require('formatter').setup({
  filetype = {
    python = {
      function()
        return {
          exe = "black",
          args = { "-" },
          stdin = true
        }
      end
    }
  }
})

vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.py FormatWrite
  augroup END
]]

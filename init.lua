local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.mkdir(vim.fn.stdpath("data") .. "/lazy", "p")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
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

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

vim.opt.showmode = false

-- [[ Basic Autocommands ]]
-- See :help lua-guide-autocommands

--Hightlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

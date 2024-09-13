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

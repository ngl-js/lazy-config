-- Check if 'pwsh' is executable and set the shell accordingly
if vim.fn.executable("pwsh") == 1 then
  vim.o.shell = "pwsh"
else
  vim.o.shell = "powershell"
end
-- Setting shell command flags
vim.o.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
-- Setting shell redirection
vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
-- Setting shell pipe
vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'
-- Setting shell quote options
vim.o.shellquote = ""
vim.o.shellxquote = ""

vim.opt.winbar = "%=%m %f"
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.g.lazyvim_picker = "telescope"
vim.wo.number = true -- Make line numbers default
vim.o.relativenumber = true -- set relative numbered lines
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.o.wrap = false -- display lines as one long line
vim.o.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
vim.o.numberwidth = 4 -- set number column width to 2 {default 4}
vim.o.backspace = "indent,eol,start" -- allow backspace on
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.fileencoding = "utf-8" -- the encoding written to a file

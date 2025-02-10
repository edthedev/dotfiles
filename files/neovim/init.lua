local nvjournal = require("plugins.nvjournal")
nvjournal.setup()

vim.print("Setup Vundle")

-- Ensure Vundle is installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/Vundle.vim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/VundleVim/Vundle.vim.git', install_path})
end

-- Initialize Vundle
vim.cmd [[
  set nocompatible              " Be iMproved, required
  filetype off                  " Required

  " Set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  
  " Let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " Add plugins here
  " For example, to add vim-fugitive:
  " Plugin 'tpope/vim-fugitive'
  Plugin 'vim-pandoc/vim-pandoc-syntax'
  
  call vundle#end()            " Required
  filetype plugin indent on    " Required

  augroup pandoc_syntax
      au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
  augroup END


  let g:pandoc#syntax#conceal#use = 0

]]


-- vim.print("what?")
vim.opt.number = true
vim.g.mapleader = ' '

vim.api.nvim_set_keymap("n", "<leader>j", ":Note<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>d", ":Note<CR>daily<CR>", { noremap = true, silent = true })



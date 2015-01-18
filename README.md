Vim-phpfmt
==========

Inspired by vim-php-cs-fixer.

Integrate [php.tools](https://github.com/dericofilho/php.tools).

This plugin will execute the `fmt.phar` command on the directory or file (depends on which command you call). See options to know how to customize that.

**Options available**:

```viml
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1) " format on save (autocmd)
" If phpfmt is in $PATH, you don't need to define line below
" let g:phpfmt_path = "~/phpfmt.phar" " define the path to the phpfmt.phar
let g:phpfmt_config = ".php.tools.ini"             " configuration file
let g:phpfmt_php_path = "php"               " Path to PHP
"let g:phpfmt_prepasses_list = "AutoPreincrement,JointToImplode"
"let g:phpfmt_passes_list = "ReturnNull"
let g:phpfmt_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
```

Default mapping is `<leader>pcd`

If you want to change it:

```viml
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
```

# Installation

Via **[Vundle](https://github.com/gmarik/vundle)**, add:

```viml
Bundle 'dericofilho/vim-phpfmt'
```

Via **[Pathogen](https://github.com/tpope/vim-pathogen)**, do:

```bash
cd ~/.vim/bundle
git clone git@github.com:dericofilho/vim-phpfmt.git
```

To see how to install `php.tools`, look at [php.tools](https://github.com/dericofilho/php.tools) repository.

If you see any improvement or question, contribute or create an issue.


Vim-phpfmt
================

Integrate [phpfmt](https://github.com/fabpot/phpfmt) created by fabpot.

This plugin will execute the `phpfmt` command on the directory or file (depends on which command you call). See options to know how to customize that.

**Options available**:

```viml
" If phpfmt is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/phpfmt.phar" " define the path to the phpfmt.phar
let g:php_cs_fixer_level = "all"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
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
Bundle 'stephpy/vim-phpfmt'
```

Via **[Pathogen](https://github.com/tpope/vim-pathogen)**, do:

```bash
cd ~/.vim/bundle
git clone git@github.com:stephpy/vim-phpfmt.git
```

To see how to install `phpfmt`, look at [phpfmt](https://github.com/fabpot/phpfmt) repository.

If you see any improvement or question, contribute or create an issue


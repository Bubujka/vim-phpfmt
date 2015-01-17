"=============================================================================
" File: phpfmt.vim
" Author: Carlos Cirello
" Inspired by: vim-php-cs-fixer

if exists("g:vim_phpfmt") || &cp
    finish
endif
let g:vim_phpfmt = 1

let g:phpfmt_path = get(g:, 'phpfmt_path', '~/fmt.phar')
let g:phpfmt_php_path = get(g:, 'phpfmt_php_path', 'php')
let g:phpfmt_enable_default_mapping = get(g:, 'phpfmt_enable_default_mapping', '1')

if executable('fmt.phar')
  let g:phpfmt_command = 'fmt.phar'
else
  let g:phpfmt_command = g:phpfmt_php_path.' '.g:phpfmt_path
end

if exists('g:phpfmt_config')
  let g:phpfmt_command = g:phpfmt_command.' --config='.g:phpfmt_config
endif


fun! PhpFmtFix(path, dry_run)

    if !executable('fmt.phar')
      if !filereadable(expand(g:phpfmt_path))
        echoerr(g:phpfmt_path.' is not found')
      endif
    endif

    let command = g:phpfmt_command.' '.a:path

    if exists('g:phpfmt_passes_list')
        let command = command.' --passes='.g:phpfmt_passes_list
    endif

    if exists('g:phpfmt_prepasses_list')
        let command = command.' --prepasses='.g:phpfmt_prepasses_list
    endif

    if exists('g:phpfmt_psr1')
        let command = command.' --psr1'
    endif

    if exists('g:phpfmt_psr2')
        let command = command.' --psr2'
    endif

    let s:output = system(command)
    if v:shell_error
        echohl Error | echo s:output | echohl None
    else
        exec 'edit!'
        let s:nbLines = len(split(s:output, '\n'))

        if s:nbLines > 0
            echohl Title | echo s:nbLines." file(s) modified(s)" | echohl None
        else
            echohl Title | echo "There is no cs to fix" | echohl None
        endif

        call PhpFmtFix(a:path, 0)
    endif
endfun

fun! PhpFmtFixDirectory()
    call PhpFmtFix(expand('%:p:h'), g:phpfmt_dry_run)
endfun

fun! PhpFmtFixFile()
    call PhpFmtFix(expand('%:p'), g:phpfmt_dry_run)
endfun

if(g:phpfmt_enable_default_mapping == 1)
    nnoremap <silent><leader>pcd :call PhpFmtFixDirectory()<CR>
    nnoremap <silent><leader>pcf :call PhpFmtFixFile()<CR>
endif

" vim: foldmethod=marker

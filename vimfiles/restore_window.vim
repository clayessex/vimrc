"
" Automatically save/restore the vim window position and size
" Only restores window size for console version
" 
" Modified from: 
"    http://vim.wikia.com/wiki/Restore_screen_size_and_position
"

function! ScreenFilename()
  if has('amiga')
    return "s:.vimsize"
  elseif has('win32')
    return $HOME.'\_vimsize'
  else
    return $HOME.'/.vimsize'
  endif
endfunction

function! ScreenRestore()
  " Restore window size (columns and lines) and position
  " from values stored in vimsize file.
  " Must set font first so columns and lines are based on font size.
  let f = ScreenFilename()
  if g:screen_size_restore_pos && filereadable(f)
    let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
    for line in readfile(f)
      let sizepos = split(line)
      if len(sizepos) == 5 && sizepos[0] == vim_instance
        silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
		  if sizepos[3] >= 0 && sizepos[4] >= 0
			silent! execute "winpos ".sizepos[3]." ".sizepos[4]
		  endif
        return
      endif
    endfor
  endif
endfunction

function! ScreenSave()
  " Save window size and position.
  if g:screen_size_restore_pos
    let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
    let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
          \ getwinposx() . ' ' .  getwinposy()
    let f = ScreenFilename()
    if filereadable(f)
      let lines = readfile(f)
      call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
      call add(lines, data)
    else
      let lines = [data]
    endif
    call writefile(lines, f)
  endif
endfunction

if !exists('g:screen_size_restore_pos')
  let g:screen_size_restore_pos = 1
endif
if !exists('g:screen_size_by_vim_instance')
  let g:screen_size_by_vim_instance = 1
endif
autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif


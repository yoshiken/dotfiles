"#####プラグイン#####
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

filetype off
filetype plugin indent off
call neobundle#begin(expand('~/.vim/bundle/')) 

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Vimで非同期処理を行ったりするやつ
" 直接は使わないが、いくつかのプラグインはこれがインストール
" されていると速くなる
NeoBundle 'Shougo/vimproc', {
      \ 'build': {
      \ 'windows' : 'make -f make_wingw32.mak',
      \ 'cygwin'  : 'make -f make_cygwin.mak',
      \ 'mac'     : 'make -f make_mac.mak',
      \ 'unix'    : 'make -f make_unix.mak'
      \ }
      \ }

" 補完をいい感じにやってくれるやつ
NeoBundle 'Shougo/neocomplete.vim'

" Vimからgitを便利に使えるやつ
" lightlineに現在のgit branchを表示する部分で使っている
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_mapping_j = '<C-j>'
let g:EasyMotion_mapping_k = '<C-k>'

" Unite
NeoBundle 'Shougo/unite.vim'

" 見た目の色を綺麗にしてくれる
NeoBundle 'chriskempson/base16-vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck


" Uniteの設定
" ファイルの絞込とか色々やってくれる
call unite#custom#profile('ctrlp', 'context', {
    \ 'start_insert': 1,
    \ 'winheight': 20,
    \ 'direction': 'botright',
    \ 'buffer_name': 'async'
    \ })

function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git")
    " If current dir is root git directory.
    Unite -profile-name=ctrlp file_rec/git
  else
    Unite -profile-name=ctrlp file_rec/async:!
  endif
endfunction
" ctrl-pを実行するとファイル絞込
nnoremap <silent> <C-p> :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>

if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  " Use pt in unite grep source.
  " https://github.com/monochromegane/the_platinum_searcher
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
  let g:unite_source_grep_recursive_opt = ''
endif


"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set expandtab "タブの変わりにスペースを入れる
syntax on "コードの色分け
set background=dark
colorscheme base16-default

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

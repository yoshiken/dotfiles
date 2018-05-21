"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set expandtab "タブの変わりにスペースを入れる
syntax on "コードの色分け
set background=dark "厨二なので
set cursorline "現在行を強調
set cursorcolumn "現在列を強調
set wildmode=list:longest "コマンドラインを保管

"######システム#####
set fenc=utf-8 "UTF-8化
set noswapfile "スワップファイルを作らない
set nobackup "バックアップファイルを作らない
set autoread "編集中のファイルが変更されると自動で読み込み
set showcmd "入力中のコマンドをステータスに表示


"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索語をハイライト
set incsearch "検索入寮時にリアルタイムでヒットさせる
nmap <Esc><Esc> :nohlsearch<CR><Esc>

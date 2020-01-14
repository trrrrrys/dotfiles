
" 基本設定の読み込み
call map(sort(split(globpath(&runtimepath, '_config/init/*.vim'))), {->[execute('exec "so" v:val')]})

" プラグインの設定の読み込み
call map(sort(split(globpath(&runtimepath, '_config/plugins/*.vim'))), {->[execute('exec "so" v:val')]})


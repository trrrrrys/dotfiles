
" 基本設定の読み込み
call map(sort(split(globpath(&runtimepath, '_conf/init/*.vim'))), {->[execute('exec "so" v:val')]})
" プラグインの設定の読み込み
call map(sort(split(globpath(&runtimepath, '_conf/plugins/*.vim'))), {->[execute('exec "so" v:val')]})


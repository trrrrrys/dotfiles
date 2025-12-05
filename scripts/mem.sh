#!/bin/sh

# vm_statコマンドでメモリ統計を取得
vm_stat_output=$(vm_stat)

# ページサイズの取得
page_size=$(sysctl -n hw.pagesize)

# 各メモリ項目の値を抽出してページ数を計算
free_pages=$(echo "$vm_stat_output" | grep 'Pages free' | awk '{print $3}' | sed 's/\.//')
active_pages=$(echo "$vm_stat_output" | grep 'Pages active' | awk '{print $3}' | sed 's/\.//')
inactive_pages=$(echo "$vm_stat_output" | grep 'Pages inactive' | awk '{print $3}' | sed 's/\.//')
speculative_pages=$(echo "$vm_stat_output" | grep 'Pages speculative' | awk '{print $3}' | sed 's/\.//')
# 使用済みのメモリ（アクティブ、非アクティブ、スペキュレイティブ）の合計
used_memory=$(( ($active_pages + $inactive_pages + $speculative_pages) * $page_size ))
# 空きメモリ
free_memory=$(( $free_pages * $page_size ))
# 全体のメモリ
total_memory=$(sysctl -n hw.memsize)
# 使用率を計算
used_percentage=$(echo "scale=2; $used_memory / $total_memory * 100" | bc)

echo $used_percentage

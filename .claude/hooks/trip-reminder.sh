#!/bin/bash
# 札幌・小樽旅行(2026/07/22-24)のリマインドを SessionStart 時に表示する。
# トリップディレクトリが消されたら何も出さない(セルフクリーンアップ)。

if [ ! -d "$(dirname "$0")/../../trip-260722-260724" ]; then
  exit 0
fi

today=$(date +%Y%m%d)
msg=""

if [ "$today" -ge 20260722 ]; then
  exit 0
elif [ "$today" -ge 20260714 ]; then
  msg="[札幌・小樽旅行] 宿キャンセル無料期限(7/14)を過ぎました。札幌グランドホテル(¥46,500)はもう取消不可。残りタスクは trip-260722-260724/README.md を参照。"
elif [ "$today" = "20260713" ]; then
  msg="[札幌・小樽旅行] 明日(7/14)が宿キャンセル無料期限の最終日!飛行機未確保なら今日中に判断を。trip-260722-260724/flight-watch.md"
elif [ "$today" -ge 20260624 ]; then
  msg="[札幌・小樽旅行] 出発28日前。航空券は確保済み? 未確保なら宿キャンセル期限(7/14)までに判断必須。dsk.ne.jp/m/ をチェック。"
elif [ "$today" -ge 20260607 ]; then
  msg="[札幌・小樽旅行] 出発45日前。航空券まだなら今すぐ動く。dsk.ne.jp/m/ でセール確認。"
elif [ "$today" -ge 20260508 ]; then
  msg="[札幌・小樽旅行] 出発75日前の早割タイミング。dsk.ne.jp/m/ で航空券セール要確認。"
fi

if [ -n "$msg" ]; then
  jq -n --arg m "$msg" '{systemMessage: $m}'
fi

#!/bin/sh

# 環境変数 LINE_TOKEN に取得したトークンを指定してください。
LINE_TOKEN="ここにLINE_TOKEN貼付け"

if [ $# = 1 ]; then

    # チャンネル名, チャンネルタイプ, 番組名, 番組概要の読み込み
    if [ -z "$CHANNELTYPE" ]; then
        CHANNELTYPE="チャンネルタイプ未設定"
    else
        :
    fi
    if [ -z "$CHANNELNAME" ]; then
        CHANNELNAME="放送局名なし"
    else
        :
    fi
    if [ -z "$NAME" ]; then
        title="タイトル未設定"
    else
        title=$NAME
    fi
    if [ -z "$DESCRIPTION" ]; then
        description="番組概要が指定されていません。"
    else
        description=$DESCRIPTION
    fi

    # 引数をコピー (コマンドとして認識されるのを防ぐため)
    ret=$1

    # 予約関係: 追加, 削除, 更新, 録画準備
    if [ $ret = "reserve" ]; then
        content="%0D%0A ✅ 予約追加 %0D%0A ${title} %0D%0A ${CHANNELTYPE} ${CHANNELNAME} %0D%0A 番組概要: %0D%0A ${description}"
    elif [ $ret = "delete" ]; then
        content="%0D%0A 💨 予約削除 %0D%0A ${title} @ ${CHANNELTYPE} ${CHANNELNAME}"
    elif [ $ret = "update" ]; then
        content="%0D%0A 🔁 予約更新 %0D%0A ${title} @ ${CHANNELTYPE} ${CHANNELNAME}"
    elif [ $ret = "prestart" ]; then
        content="%0D%0A 🔷 録画準備開始 %0D%0A ${title}　@ ${CHANNELTYPE} ${CHANNELNAME}"
    elif [ $ret = "prepfailed" ]; then
        content="%0D%0A 💥 録画準備失敗 %0D%0A ${title}　@ ${CHANNELTYPE} ${CHANNELNAME}"
    elif [ $ret = "start" ]; then
        content="%0D%0A ⏺ 録画開始 %0D%0A ${title}　@ ${CHANNELTYPE} ${CHANNELNAME}"
    elif [ $ret = "end" ]; then
         content="%0D%0A ⏹ エンコード終了 %0D%0A ${title} @ ${CHANNELTYPE} ${CHANNELNAME}"
    elif [ $ret = "encod_end" ]; then
        # エラー, ドロップ, スクランブルカウントを読み込み
        if [ -z "$ERROR_CNT" ]; then
            ERROR_CNT="N/A"
        else
            : # 何もしない
        fi
        if [ -z "$DROP_CNT" ]; then
            DROP_CNT="N/A"
        else
            : # 何もしない
        fi
        if [ -z "$SCRAMBLING_CNT" ]; then
            SCRAMBLING_CNT="N/A"
        else
            : # 何もしない
        fi
        content="%0D%0A ⏹ 録画終了 %0D%0A ${title} @ ${CHANNELTYPE} ${CHANNELNAME} %0D%0A 番組概要: %0D%0A ${description} %0D%0A エラー: ${ERROR_CNT}, ドロップ: ${DROP_CNT}, スクランブル: ${SCRAMBLING_CNT}"
    elif [ $ret = "recfailed" ]; then
        # エラー, ドロップ, スクランブルカウントを読み込み
        if [ -z "$ERROR_CNT" ]; then
            ERROR_CNT="N/A"
        else
            : # 何もしない
        fi
        if [ -z "$DROP_CNT" ]; then
            DROP_CNT="N/A"
        else
            : # 何もしない
        fi
        if [ -z "$SCRAMBLING_CNT" ]; then
            SCRAMBLING_CNT="N/A"
        else
            : # 何もしない
        fi
        content="%0D%0A ❌ 録画失敗 %0D%0A ${title} @ ${CHANNELTYPE} ${CHANNELNAME} %0D%0A 番組概要: %0D%0A ${description} %0D%0A エラー: ${ERROR_CNT}, ドロップ: ${DROP_CNT}, スクランブル: ${SCRAMBLING_CNT}"
    else
        echo "引数が不正です。"
        exit 1
    fi
    
    curl -X POST -H "Authorization: Bearer ${LINE_TOKEN}" --data-binary "message=${content}" GetAsURLEncoded https://notify-api.line.me/api/notify
    
else
    echo "引数を指定してください。"
fi

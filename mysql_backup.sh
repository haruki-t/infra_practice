#!/bin/sh

# バックアップファイルを保存するディレクトリパス
DIRPATH='/var/backup/mysql-dump'

# 5日間バックアップを残す
PERIOD=5
# -------------------------------------------------------

#
# [バックアップ取得処理]
FILEDATE=`date +%y%m%d`

# mysqldumpを実行しdumpファイルを出力
mysqldump --defaults-extra-file=/var/backup/sh/dbaccess.cnf > $DIRPATH/$FILEDATE.sql

# 出力されたdumpファイルのパーミション変更
chmod 700 $DIRPATH/$FILEDATE.sql

#
# [ローテーション処理]
#
# 削除対象年月日を取得
OLDDATE=`date --date="$PERIOD days ago" +%y%m%d`


# 削除実行
rm -f $DIRPATH/$OLDDATE.sql
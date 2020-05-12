qmk firmwareでmac向けに設定した 英/かなスキャンコード を
それぞれwindowsの 無変換/変換スキャンコード にマッピングする
(regeditでHKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layoutに新規ファイルscancodemapを作成して読み込ませる)

0x71 to 0x7B(無変換)
0x72 to 0x79(変換)

windowsではリトルエンディアンのため、実際には上下バイトを入れ替える00 7B to 7B 00

ref. http://overslept-dev.hatenablog.com/entry/2017/06/26/144854

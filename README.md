mrcal-ps1
=========

Skeleton code to generate and manipulate machine-readable one year calendar.

機械可読な年間カレンダーを生成するためのスケルトンコードです。
若干、会社カレンダーの作成向けです。

License
-------

zlib License.

Target environments
-------------------

Windows with PowerShell 2.0 or later.

PowerShell 2.0以降を利用可能なWindows環境で使用できます。
ただし現状ではWindows 7 + PowerShell 2.0の組み合わせでしか動作確認していません。

Set up
------

1. Put all files in a directory.
2. Modify mrcal\_cfg.ps1.
3. (Optional) Modify `With-RegularHoliday` in mrcal.ps1.

1. 全ファイルを適当なフォルダにコピーしておきます。
2. mrcal\_cfg.ps1の中身を調整します。
    * 作成するカレンダーの西暦・開始月・期間と、休日と見なす日のテーブルを調整してください。
    * NATIONAL\_HOLIDAY（祝日）については、内閣府の祝日一覧からコピーしています。
        * 「国民の祝日に関する法律」のアルゴリズム実装が面倒だったため。
        * 春分の日と秋分の日は前年の官報で公表されるのでアルゴリズム化できない、という理由もあります。
    * NOT\_HOLIDAYに登録した日は、休日ではないと見なされます。
        * 年間稼働日の都合で例外的に出勤日扱いしたい、というケースで使えます。
    * PAID\_TIME\_OFF\_DAYは年次有給休暇の計画的付与（特に一斉付与）の時に使用してください。
3. 必要に応じてmrcal.ps1の `With-RegularHoliday` を修正してください。
    * スケルトンコードでは、機械的に土日を休日と見なしています。
    * mrcal\_cfg.ps1のNOT\_HOLIDAYは `With-RegularHoliday` の実装で楽をするための仕掛けだったりします。

Usage
-----

See \`Example'.

mrcal.ps1でカレンダーを生成します。
生成されるカレンダーはXML（CLiXML）です。
System.DateTimeのオブジェクトに次のプロパティを追加してシリアライズ化しています。

Holiday
: 休日（年次有給休暇の計画的付与を含む）なら$true。
PaidTimeOff
: 年次有給休暇の計画的付与による休みなら$true。

上記プロパティは、出力されたカレンダーを直接編集して変更することも可能です。

to\_tsv.ps1は、生成されたカレンダーを操作するサンプルコードです。
日付と休日関連のプロパティのみを抽出して、TSV形式で出力します。

ラッパーのバッチファイル（mrcal.bat、to\_tsv.bat）も用意してあります。
コマンドプロンプト使いの人は、こちらを使用した方が楽かもしれません。

Example
-------

```PowerShell
## Generate calendar
.\mrcal.ps1 calendar.xml

## Convert calendar to TSV
.\to_tsv.ps1 calendar.xml | more
```

# git log コマンド

## 説明
git logとはGitのコミット履歴を参照する際に使うコマンドのこと。
また、ファイルやディレクトリを追加したり、編集したりした記録をローカルリポジトリに反映させることをコミットと言います。

git logにはオプション機能が存在します。
以下にオプションの一部を紹介します。

git log --oneline
(-oneline)は各コミット履歴を1行で表示することができます。

git log　--graph
(-graph)はコミット履歴をアスキーグラフでグラフィカルに表示できます。

git log --oneline --graph
上2つのオプションを組み合わせることで、コミット同士のつながりを樹形図のように表示することができます。

git log --grep='keyword'
(-grep)は指定した文字列が含まれるコミット履歴を抽出・表示することができます。

git log --author=username
(-author)は指定したユーザによるコミット履歴を抽出して表示することができます。

git log -n x
(-n)はgit logで検索・表示するコミット数を指定できます。
xに任意の数字を入力できます。

git log --since=
(-since)は表示されるコミット履歴を指定した日時以降のものに限定できます。
イコールの後に"x days ago",x.weeks,"yyyy-mm-dd tt:tt:tt"等で限定することができます。
xは任意の数字、yは年、mは月、dは日、tは時間です。

git log --merges
(-merges)はマージコミットのみに限定して表示したい時に使われます。
ここでマージコミットとは複数のコミットをまとめるためのコミットのことをいい、特徴として複数の親コミットを持ちます。

git log -p
コミットの変更内容を出力します。

git log --stat
コミットによって変更のあったファイルとその行数を表示します。

git log --name-only
変更のあったファイル名のみを出力できます。






## 参考文献

- 【Git/GitHub入門】「git log」コマンドの使い方・活用(https://www.kagoya.jp/howto/rentalserver/webtrend/gitlog/)
- 【Git覚書き】マージした時にコミットが作成される場合と作成されない場合の違い(https://qiita.com/nnhkrnk/items/7a3409587d5e5c217447)
- 【Git】logの見方(https://qiita.com/shun_173/items/e94fde2494147a7031e7)

## 作成者

- 氏名: 春木 龍人
- 学籍番号: G284952022
- 作成日: 2025-11-14
- 最終更新日: 2025-11-14
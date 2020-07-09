# 4d-tips-basic-orda-list
ORDAとリストボックスの基本的な例題

#### 使い方

* プロジェクト``basic-orda-list-1``を4Dで開きます。

* プロジェクト``basic-orda-list-2``を4D Serverで開きます。

データファイルが違うだけなので，逆でも構いません。

4D Serverは起動時に``On Server Startup``でWebサーバーを開始します。

``TEST``フォームを開きます。

ラジオボタンでローカルとリモートのデータストアを切り替えることができます。

<img width="454" alt="スクリーンショット 2020-07-09 17 28 21" src="https://user-images.githubusercontent.com/1725068/87016671-fa6a8300-c209-11ea-87dd-50c7aadc25e1.png">

####　おまけ

``test_execute_on_server``は「サーバー上で実行メソッド」の例題です。ぷりエンプティブスレッドからワーカーを起動し，``Signal``で待ち合わせます。

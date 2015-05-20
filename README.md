# Portal Crawler [![Code Climate](https://codeclimate.com/github/UTF-9/portal-crawler/badges/gpa.svg)](https://codeclimate.com/github/UTF-9/portal-crawler) [![Dependency Status](https://gemnasium.com/UTF-9/portal-crawler.svg)](https://gemnasium.com/UTF-9/portal-crawler)

KIT学生ポータルの科目別連絡とライブラリセンターの本の貸出数を取得しSlackに通知します

## Usage
学生ポータルの科目別連絡を取得します:

	$ rake portal
	
LCの貸出数などを取得します:

	$ rake library
	
## Install
このソフトウェアの使用にはGitが必要です:
	
	Mac :
	$ brew install git
	Linux :
	$ apt-get install git
	もしくは
	$ yum install git 

このリポジトリをクローンし、フォルダに移動します:

	$ git clone git://github.com/UTF-9/portal-crawler.git
	$ cd portal-crawler

	
必要なgemをインストールします:

	$ bundle install

`config.yml`に以下の要素を設定します:

~~~yaml
portal:
  id: ポータルのログインID
  pass: ポータルのログインパスワード

library:
  id: LCのログインID
  pass: LCのログインパスワード

slack:
  token: トークン
  portal_room: チャンネル名("#"を付けない)
  library_room: チャンネル名("#"を付けない)
  log_room: チャンネル名("#"を付けない) #オプション
~~~

## 必要環境
* Ruby 2.2.0 or Later
* rake  10.0 or Later

## 追加するかもしれない機能
* Twitterのサポート
* 授業の資料を自動ダウンロード
* その他いっぱい...

## License
Released under the [MIT Licence](https://github.com/UTF-9/portal-crawler/blob/master/LICENSE)

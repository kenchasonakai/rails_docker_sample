# Dockerテンプレート利用方法
## Docker用の初期設定
- clone後にディレクトリ名を自分で作りたいアプリケーション名に変更
- RUBY_VERSIONを修正
- NODE_VERSIONを修正
- DockerfileのAPP_NAMEをディレクトリ名で修正
- docker-compose.ymlのAPP_NAMEをディレクトリ名で修正
## Railsの初期設定
- Gemfileのrailsのバージョンを自分で使いたいRailsのバージョンに修正
- `docker-compose build`
- `docker-compose run web rails new . -f`
## Railsの起動
- `docker-compose run web rails db:create`
- `docker-compose up`

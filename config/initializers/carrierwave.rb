# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   config.storage = :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: Rails.application.secrets.aws_access_key_id,
#     aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
#     region: 'ap-northeast-1'
#   }

#   config.fog_directory  = 'mealcoupon'
#   config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mealcoupon'
# end

# app/uploaders/imageuploaderからのfogでのアップロードの場合、このファイルの設定内容を用いてs3に上がります。
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? # 本番環境:AWS使用
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      # aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      # aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      # 上記はrailsのverが5.1系以下の場合に使用します。環境変数はsecrets.ymlにいれていましたが5.2系からは存在しません。
      # 下記では5.2系以上用のcredentials.yml.encにある環境変数を使用する場合の記述です。
      # (もし動かなくて環境変数のせいなら、ENVで呼び出すことになりそう)
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'#東京リージョンを選択
    }

    config.fog_directory  = 'freemarketsample71g'#←バケット名です。
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarketsample71g'#バケット名までのurlです。
  else
    config.storage :file # 開発環境(本番環境ではないなら):画像はpublic/uploades下に保存
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end
end
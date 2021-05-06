RakutenWebService.configure do |c|
  # (必須) アプリケーションID
  c.application_id = Rails.application.credentials.dig(:rakuten, :application_id)

  # (任意) 楽天アフィリエイトID
  c.affiliate_id = Rails.application.credentials.dig(:rakuten, :affiliate_id)

  # (任意) リクエストのリトライ回数
  # 一定期間の間のリクエスト数が制限を超えた時、APIはリクエスト過多のエラーを返す。
  # その後、クライアントは少し間を空けた後に同じリクエストを再度送る。
  c.max_retries = 3 # default: 5

  # (任意) デバッグモード
  # trueの時、クライアントはすべてのHTTPリクエストとレスポンスを
  # 標準エラー出力に流す。
  c.debug = true # default: false
end

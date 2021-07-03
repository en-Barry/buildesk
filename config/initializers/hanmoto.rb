Hanmoto.configure do |config|
  config.view_dir = 'public_pages' # hanmoto甩のviewファイル置き場。デフォルトは`public_pages`
  config.layouts = {
    html: 'public',                # 使用するlayoutファイル。通常のlayoutと使い分けたいなどに設定する。デフォルトは`public`
  }
end
class Api::V1::ItemsController < ApplicationController
  skip_before_action :require_login, only: %i[search]

  def new; end

  def search
    @items = search_by_rakuten(params[:keyword])
  end

  private

  def search_by_rakuten(_keyword)
    items = [] # メソッドが呼ばれる毎に空にしておく

    if params[:keyword]
      results = RakutenWebService::Ichiba::Product.search(
        keyword: params[:keyword],
        hits: 18
      )
      results.each do |result|
        item = {
          item_code: result['productId'],
          name: result['productName'],
          maker: result['makerName'],
          price: result['averagePrice'],
          image: result['mediumImageUrl'].gsub('?_ex=128x128', ''),
          rakuten_url: result['affiliateUrl']
        }
        items << item # ハッシュ化したデータを配列に入れる
      end
    end
    items
  end
end

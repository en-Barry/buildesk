class Api::V1::ItemsController < ApplicationController
  skip_before_action :require_login, only: %i[search]

  def new; end

  def show; end

  # def search
  #   if params[:keyword]
  #     @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
  #     #render json: { status: 'success', data: @items }
  #   end
  # end

  def search
    # contents = render_to_string(partial: 'item_list', locals: {items: search_by_rakuten(params[:keyword])})
    contents = search_by_rakuten(params[:keyword])
    # contentsをjsonに返す
    render json: { contents: contents }
  end

  private

  def search_by_rakuten(_keyword)
    items = [] # メソッドが呼ばれる毎に空にしておく

    if params[:keyword]
      results = RakutenWebService::Ichiba::Item.search(
        keyword: params[:keyword],
        hits: 10,
        imageFlag: 1
      )
      results.each do |result|
        item = {
          item_code: result['itemCode'],
          name: result['itemName'],
          price: result['itemPrice'],
          image: result['mediumImageUrls'][0].gsub('?_ex=128x128', ''),
          rakuten_url: result['itemUrl']
        }
        items << item # ハッシュ化したデータを配列に入れる
      end
    end
    items
  end
end

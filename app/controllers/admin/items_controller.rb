class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true).page(params[:page])
  end

  def new
    @item = Item.new
  end

  def show; end

  def edit; end

  def create
    @item = Item.new(user_params)
    if @item.save
      redirect_to admin_item_path(@item), success: t('defaults.message.created', item: Item.model_name.human)
    else
      edirect_to admin_item_path(@item), danger: t('defaults.message.not_created', item: Item.model_name.human)
    end
  end

  def update
    if @item.update(item_params)
      redirect_to admin_item_path(@item), success: t('defaults.message.updated', item: Item.model_name.human)
    else
      redirect_to admin_item_path(@item), danger: t('defaults.message.not_updated', item: Item.model_name.human)
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_path, success: t('defaults.message.deleted', item: Item.model_name.human)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_code, :name, :price, :rakuten_url, :amazon_url, :image)
  end
end

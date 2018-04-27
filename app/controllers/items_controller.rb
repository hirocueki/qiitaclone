class ItemsController < ApplicationController
  before_action :set_user
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @item = @user.items.new
  end

  def edit
  end

  def create
    @item = @user.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to user_url(@user), notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to [@user,@item], notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user), notice: 'Item was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :body)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end

class ItemsController < ApplicationController
  def new
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
end

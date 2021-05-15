class SavesController < ApplicationController
  
  def show
    @item = $featuredItem
  end
  
end

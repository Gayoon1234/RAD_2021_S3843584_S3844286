class StaticPagesController < ApplicationController
  def home
    maximumItems = Item.count
    randomItemIndex = 1 + rand(maximumItems)
    @item = Item.find(randomItemIndex)
  end
end

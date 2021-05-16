class SavesController < ApplicationController
  
  def show
    @item = $featuredItem
    newSave = Save.create(name: @item.name, username:nil)
    newSave.save!;
    
    @SavedList = Array.new
    
    Save.all.each do |saveItem|
      Item.where(name: saveItem.name).each{|item| @SavedList.push(item)}
    end
    
    
    @arr = Array.new
    @arr.push("test")
    @arr.push(Save.count)
    
  end
  
end

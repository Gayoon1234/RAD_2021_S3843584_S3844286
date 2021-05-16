class SavesController < ApplicationController
  
  def show
    
    # we get the current featured item
    @item = $featuredItem
    
    
    #add it to the database, for username:nil to work I commented out a line in the save.rb model
        if Save.where(:name => @item.name).blank?
      newSave = Save.create(name: @item.name, username: nil)
      newSave.save!
    end
    
    
    # for each item saved  by the current user
    @SavedList = Array.new
    Save.where(username: nil).each do |saveItem|
      Item.where(name: saveItem.name).each{|item| @SavedList.push(item) if !@SavedList.include?(item)}
                                                                        #this if statement filters out duplicate entries already present
    end
    
    # this just appends some test stuff to the end
    @arr = Array.new
    @arr.push("test")
    @arr.push(Save.count)

  end
  
end

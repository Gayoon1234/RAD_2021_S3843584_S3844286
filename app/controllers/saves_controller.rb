class SavesController < ApplicationController
  
  def show
    #iterate through the SavedList to get SavedItems for a particular user
    
    # for each item saved  by the current user
    @SavedList = Array.new
    Save.where(username: cookies[:mockuser]).each do |saveItem|
      Item.where(name: saveItem.name).each{|item| @SavedList.push(item)}
    end
    
  end
  
  def new
    
    cookies[:mockuser] = {value: "MockUser"} #change to logged-in user # move to when they login
    
    #takes username + item id, and adds them to Saved Item DB
    
    @item = Item.find(params[:id])
    
    #TODO: Make sure that checks USER + ITEM
    if Save.where(:name => @item.name).blank?
      newSave = Save.create(name: @item.name, username: "MockUser") #change to logged-in user
      newSave.save! #throws error if save does not work
    end
    
  end
  
  def remove
    
    @item = Item.find(params[:id])
    
    Save.find_by(name: @item.name, username: "MockUser").destroy #change to logged-in user
    
  end
  
end

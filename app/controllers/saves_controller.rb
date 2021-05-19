class SavesController < ApplicationController
  
  def show
    
    userNameVar = current_user.username if current_user
    
    userNameVar ||= "NoUser"
    
    itemsFromCookie = Array.new
    
    itemsFromCookie = cookies[userNameVar + "_saved"].split("_") if cookies[userNameVar + "_saved"]
    
    @SavedList = Array.new
    
    itemsFromCookie.each do |index|
      @SavedList.push(Item.find(index))
    end
    
  end
  
  def new
    # needed to show picture for save page
    @item = Item.find(params[:id])
    
    userNameVar = current_user.username if current_user
    
    userNameVar ||= "NoUser"
    
    saveCookie = cookies[userNameVar + "_saved"]
    
    if saveCookie
      saveCookie += "_#{params[:id]}"
    else
      saveCookie = params[:id]
    end
    
    cookies[userNameVar + "_saved"] = {value: saveCookie, expires: 1.hour.from_now}
    
  end
  
  def remove
    # needed to show picture for remove page
    @item = Item.find(params[:id]) 
    
    userNameVar = current_user.username if current_user
    
    userNameVar ||= "NoUser"
    
    # puts all cookie elements in an array
    cookieContent = cookies[userNameVar + "_saved"].split("_")#.delete(params[:id])
    
    # deletes item id from array of cookie content
    cookieContent.delete(params[:id])
    
    cookies[userNameVar + "_saved"] = {value: cookieContent.join('_'), expires: 1.hour.from_now}
    
  end
  
end

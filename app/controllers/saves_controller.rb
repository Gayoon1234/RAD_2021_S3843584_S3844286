class SavesController < ApplicationController
  

  def show
    
    userNameVar = current_user.username if current_user
    
    userNameVar ||= "NoUser"
    
    itemsFromCookie = Array.new
    
    itemsFromCookie = cookies[userNameVar + "_saved"].split("_") if cookies[userNameVar + "_saved"]
    
    itemsFromCookie.shift if itemsFromCookie[0] == ''
    
    @SavedList = Array.new
    
    itemsFromCookie.each do |index|
      @SavedList.push(Item.find(index)) #if index
    end
    
  end
  
  def new
    
    itemID = params[:id]
    
    @item = Item.find(itemID)
    
    userNameVar = current_user.username if current_user
    
    userNameVar ||= "NoUser"
    
    saveCookie = cookies[userNameVar + "_saved"]
    
    itemAddedAlready = false
    
    if saveCookie
      saveCookieArray = saveCookie.split("_")
      itemAddedAlready = saveCookieArray.include? itemID
      saveCookie += "_#{itemID}" unless itemAddedAlready
    else
      saveCookie = itemID
    end
    
    itemPop = Item.find(itemID).popularity
    itemPop = itemPop ? itemPop + 1 : 1 
    Item.find(itemID).update(popularity: itemPop) unless itemAddedAlready
    
    cookies[userNameVar + "_saved"] = {value: saveCookie, expires: 1.hour.from_now}
    
  end
  
  def remove
    
    itemID = params[:id]
    
    # needed to show picture for remove page
    @item = Item.find(itemID) 
    
    userNameVar = current_user.username if current_user
    
    userNameVar ||= "NoUser"
    
    # puts all cookie elements in an array
    cookieContent = cookies[userNameVar + "_saved"].split("_")
    
    # deletes item id from array of cookie content
    cookieContent.delete(itemID)
    
    cookies[userNameVar + "_saved"] = {value: cookieContent.join('_'), expires: 1.hour.from_now}
    
  end
  
end

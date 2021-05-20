class CartsController < ApplicationController
  def show
    
    add(params) if params
    
    @cartItems = Array.new
    @clothingItems = Array.new
    
    Cart.where(username: current_user.username).each {|saveItem| @cartItems.push(saveItem.itemID)}
    
    # @cartItems.each {|cartItem| @clothingItems.push(Item.find(cartItem.itemID))}
    
  end

  def new
    itemID = params[:id]
    @item = Item.find(itemID)
  end

  def remove
  end

  def edit
  end
  
  def add(params)
    
    userNameVar = current_user.username
    colour = params[:colour]
    size = params[:size]
    quantity = params[:quantity]
    itemID = params[:itemID]
    
    Cart.create(username: userNameVar, colour: colour, size: size, quantity: quantity, itemID: itemID)
    
  end 
  
  
  def getItem(itemID)
    Item.find(itemID)
  end
  
end

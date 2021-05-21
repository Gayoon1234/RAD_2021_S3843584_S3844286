class CartsController < ApplicationController
  def show
    
    checkoutCart if params[:checkout] == "checkout"
    
    @cartItems = Array.new
    
    Cart.where(username: current_user.username).each do |saveItem|
      
      c = CartItem.new(saveItem.colour, saveItem.size, saveItem.quantity, saveItem.itemID)
      
      @cartItems.push(c)
      
    end
    
  end
  
  def new
    itemID = params[:id]
    @item = Item.find(itemID)
  end
  
  def add
    
    userNameVar = current_user.username
    colour = params[:colour]
    size = params[:size]
    quantity = params[:quantity]
    itemID = params[:itemID]
    
    Cart.create(username: userNameVar, colour: colour, size: size, quantity: quantity, itemID: itemID)
    
    @item = Item.find(itemID)
  end
  
  def remove
  end

  def edit
  end
  
  def checkoutCart
    
    userNameVar = current_user.username
    
    Cart.where(username: userNameVar).destroy_all
    
  end
  
  class CartItem
    
    attr_accessor :colour, :size, :quantity, :item
    
    def initialize(colour, size, quantity, itemID)
     @colour = colour
     @size = size
     @quantity = quantity
     @item = Item.find(itemID)
    end
    
  end
  
end

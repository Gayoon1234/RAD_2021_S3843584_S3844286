class CartsController < ApplicationController
  def show
    
    checkoutCart if params[:checkout] == "checkout"
    
    @firstTimeCheckingOut = current_user.firstCheckout
    
    @cartItems = Array.new
    
    Cart.where(username: current_user.username).each do |saveItem|
      
      c = CartItem.new(saveItem.colour, saveItem.clothing_size, saveItem.quantity, saveItem.itemID)
      
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
    clothing_size = params[:size]
    quantity = params[:quantity]
    itemID = params[:itemID]
    
    itemPop = Item.find(itemID).popularity
    itemPop = itemPop ? itemPop + 1 : 1 
    Item.find(itemID).update(popularity: itemPop)
    
    cart = Cart.create(username: userNameVar, colour: colour, clothing_size: clothing_size, quantity: quantity, itemID: itemID)
    cart.save
    
    
    @item = Item.find(itemID)
  end
  
  def remove
  end

  def edit
  end
  
  
  
  class CartItem
    
    attr_accessor :colour, :clothing_size, :quantity, :item
    
    def initialize(colour, clothing_size, quantity, itemID)
     @colour = colour
     @clothing_size = clothing_size
     @quantity = quantity
     @item = Item.find(itemID)
    end
    
  end
  
end

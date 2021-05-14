class StaticPagesController < ApplicationController
  def home
    maximumItems = Item.count
    randomItemIndex = 1 + rand(maximumItems)
    @item = Item.find(randomItemIndex)
  
  end
  
  def mens
    @tops = Array.new
    Item.where(section:"Mens", item_type:"Tops").each{ |item| @tops.push(item)}
    
    @bottoms = Array.new
    Item.where(section:"Mens", item_type:"Bottoms").each{|item| @bottoms.push(item)}
    
     @outerwear = Array.new
    Item.where(section:"Mens", item_type:"Outerwear").each{|item| @outerwear.push(item)}
  
  end
  
  def womens
    @tops = Array.new
    Item.where(section:"Womens", item_type:"Tops").each{ |item| @tops.push(item)}
    
    @bottoms = Array.new
    Item.where(section:"Womens", item_type:"Bottoms").each{|item| @bottoms.push(item)}
    
     @outerwear = Array.new
    Item.where(section:"Womens", item_type:"Outerwear").each{|item| @outerwear.push(item)}
    
    @dresses = Array.new
    Item.where(section:"Womens", item_type:"Dresses").each{|item| @dresses.push(item)}
    
  end
  
  def kids
    @tops = Array.new
    Item.where(section:"Childs", item_type:"Tops").each{ |item| @tops.push(item)}
    
    @bottoms = Array.new
    Item.where(section:"Childs", item_type:"Bottoms").each{ |item| @bottoms.push(item)}
    
  end
  
  def allItems
    @items = Array.new
    Item.all.each{ |item| @items.push(item)}
  end

end
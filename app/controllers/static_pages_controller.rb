class StaticPagesController < ApplicationController
    # using SendGrid's Ruby Library
    # https://github.com/sendgrid/sendgrid-ruby
    require 'sendgrid-ruby'
    include SendGrid
    
    def sendEmail(subscriberEmail)
        from = Email.new(email: 'sathsaraguy@outlook.com')
        to = Email.new(email: subscriberEmail)
        subject = 'Subscription'
        content = Content.new(type: 'text/plain', value: "Congratulations you have subscribed to our newsletter")
        mail = Mail.new(from, subject, to, content)

        #If you are not Gayan then please don't steal his api key
        sg = SendGrid::API.new(api_key: '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') 
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
    end
    
    def home
    maximumItems = Item.count
    randomItemIndex = 1 + rand(maximumItems)
    @featuredItem = Item.find(randomItemIndex)
    @itemCountWomens = Item.where(section:"Womens").count
    @itemCountMens = Item.where(section:"Mens").count
    @itemCountKids = Item.where(section:"Childs").count
    @itemCountNewIn = Item.where(section:"Newin").count
    
      if params[:email]
        sendEmail(params[:email])
        
        userExists = User.where(email: params[:email])
        
        if userExists.length() == 1
          User.find(userExists[0].id).update_column(:isSubscribed, true)
        end
      
      end
    end
  
  def search
    
    @searchInput = params[:searchInput]
    
    @items = Item.all
    
    @items = @items.select {|item| item.name.downcase.include? @searchInput.downcase}
    
  end
  
  
  def mens
    
    @items, @appliedFilters = applyFilters("Mens")
    
    if @appliedFilters.length() == 0
    
      @tops = Array.new
      Item.where(section:"Mens", item_type:"Tops").each{|item| @tops.push(item)} 
    
      @bottoms = Array.new
      Item.where(section:"Mens", item_type:"Bottoms").each{|item| @bottoms.push(item)}
      
      @outerwear = Array.new
      Item.where(section:"Mens", item_type:"Outerwear").each{|item| @outerwear.push(item)}
    
    end
    
  end
  
  def womens
    
    @items, @appliedFilters = applyFilters("Womens")
    
    if @appliedFilters.length() == 0
    
      @tops = Array.new
      Item.where(section:"Womens", item_type:"Tops").each{ |item| @tops.push(item)}
      
      @bottoms = Array.new
      Item.where(section:"Womens", item_type:"Bottoms").each{|item| @bottoms.push(item)}
      
      @outerwear = Array.new
      Item.where(section:"Womens", item_type:"Outerwear").each{|item| @outerwear.push(item)}
      
      @dresses = Array.new
      Item.where(section:"Womens", item_type:"Dresses").each{|item| @dresses.push(item)}
    
    end
    
  end
  
  def kids
    
    @items, @appliedFilters = applyFilters("Childs")
    
    if @appliedFilters.length() == 0
    
    @tops = Array.new
    Item.where(section:"Childs", item_type:"Tops").each{ |item| @tops.push(item)}
    
    @bottoms = Array.new
    Item.where(section:"Childs", item_type:"Bottoms").each{ |item| @bottoms.push(item)}
    
    end
    
  end
  
  def allItems
    
    @items, @appliedFilters = applyFilters(nil)
    
    
    if @appliedFilters.length() == 0
      Item.all.each{ |item| @items.push(item)} if @items.length() == 0
    end
  end
  
  def popular
    
    @items = Array.new
    Item.all.each{ |item| @items.push(item)}
    
    @items = @items.sort_by(&:popularity).reverse
    
    @items = @items[0..4]
    
  end
  
  def newin
    @items = Array.new
    Item.all.each{ |item| @items.push(item)}
    
    @items = @items.select {|item| item.stock_date <= 3}
    
  end
  
  def rating
    
    User.find(current_user.id).update_column(:firstCheckout, false)
    
    checkoutCart
    
  end
  
  def ratingSubmitted
    
    Rating.create(rating: params[:rating])
    
  end
  
  def filter
    @section = params[:section].to_s
    
    @colourFilters = ["Blue","Purple","Olive","Navy","White","Gray","Red","Black",
                      "Off-White","Natural","Beige","Dark-Green","Light-Blue","Orange","Pink"]
  end
  
  def applyFilters(section)
    
    @arrayToBeFiltered = Array.new
    if section
      Item.where(section: section).each {|item| @arrayToBeFiltered.push(item)}
    else
      Item.all.each {|item| @arrayToBeFiltered.push(item)}
    end
    potentialTypes = ["Outerwear", "Tops", "Bottoms", "Dresses", "Scarves", "Hats"]
    actualTypes = Array.new
    potentialTypes.each {|type| actualTypes.push(type) if params[type]}
    @arrayToBeFiltered = @arrayToBeFiltered.select {|item| actualTypes.include? item.item_type} unless actualTypes.length() == 0
    
    
    potentialColours = ["Blue","Purple","Olive","Navy","White","Gray","Red","Black",
                      "Off-White","Natural","Beige","Dark-Green","Light-Blue","Orange","Pink"]
    actualColours = Array.new
    potentialColours.each {|colour| actualColours.push(colour) if params[colour]}
    @arrayToBeFiltered = @arrayToBeFiltered.select {|item| actualColours.include? item.colour} unless actualColours.length() == 0
    
    
    selectedSize = params[:item_size]
    @arrayToBeFiltered = @arrayToBeFiltered.select {|item| item.item_size == selectedSize} unless !selectedSize || selectedSize == "--"
    
    @items = @arrayToBeFiltered
    
    @appliedFilters = actualTypes + actualColours
    @appliedFilters.push(selectedSize) unless !selectedSize || selectedSize == "--"
    
    return @items, @appliedFilters
  end
  
end
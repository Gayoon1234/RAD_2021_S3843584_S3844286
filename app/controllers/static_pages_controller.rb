class StaticPagesController < ApplicationController
   # using SendGrid's Ruby Library
    # https://github.com/sendgrid/sendgrid-ruby
    require 'sendgrid-ruby'
    include SendGrid
    
    def sendEmail(subscriberEmail)
        from = Email.new(email: 'sathsaraguy@outlook.com')
        to = Email.new(email: subscriberEmail)
        subject = 'You have 7 days to live...'
        content = Content.new(type: 'text/plain', value: "I hope this email finds you before I do")
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
      # puts params[:email]
      sendEmail(params[:email])
      end
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
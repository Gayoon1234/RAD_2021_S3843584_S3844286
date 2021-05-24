class ProfileController < ApplicationController
  
  require 'sendgrid-ruby'
  include SendGrid
  
  def show
    
    @user = current_user
    @subscribed = User.find(@user.id).isSubscribed
    
  end

  def subscription
    User.find(current_user.id).update_column(:isSubscribed, !current_user.isSubscribed)
    @subscriptionStatus = current_user.isSubscribed ? "Unsubscribed" : "Subscribed"
    sendEmail(current_user.email, @subscriptionStatus)
  end
  
  def sendEmail(subscriberEmail, subscriptionStatus)
        from = Email.new(email: 'sathsaraguy@outlook.com')
        to = Email.new(email: subscriberEmail)
        subject = 'Subscription Change'
        content = Content.new(type: 'text/plain', value: "Congratulations you have #{subscriptionStatus}!")
        mail = Mail.new(from, subject, to, content)

        #If you are not Gayan then please don't steal his api key
        sg = SendGrid::API.new(api_key: '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') 
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
  end
  
end

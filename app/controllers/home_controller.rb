class HomeController < ApplicationController
  
  # put in email here
  def new
    
  end
  
  # email gets posted here
  def create
    gmail_contacts = GmailContacts.new
    url = gmail_contacts.authsub_url "http://localhost:3000/home/contacts?email=#{params[:email]}"
    redirect_to url
  end

  # gmail posts back here, as long as the user selects the same account as they entered it will work
  def contacts
    gmail_contacts = GmailContacts.new params['token'].to_s

    gmail_contacts.fetch(params['email'])
    
    @contacts = gmail_contacts.contacts
  end

end

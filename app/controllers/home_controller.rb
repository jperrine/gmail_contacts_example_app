class HomeController < ApplicationController
  
  def new
    
  end
  
  def create
    gmail_contacts = GmailContacts.new
    url = gmail_contacts.authsub_url "http://localhost:3000/home/contacts?email=#{params[:email]}"
    redirect_to url
  end

  def contacts
    gmail_contacts = GmailContacts.new params['token'].to_s

    gmail_contacts.fetch(params['email'])
    
    @contacts = gmail_contacts.contacts
  end

end

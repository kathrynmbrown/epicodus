class Message < ActiveRecord::Base

  before_create :send_message

  belongs_to :order
  belongs_to :user

private

  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC5d1d1f64e78a275baa28a4bbe4165f43/Messages.json',
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => body,
                    :To => to,
                    :From => from }
    ).execute
  end
end

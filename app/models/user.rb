class User
  include Mongoid::Document
  field :Name, type: String
  field :Email, type: String
  field :Phone_No, type: Integer
  field :Password, type: String
  field :Confirm_Password, type: String
  validates :Name, :Email, :Phone_No, :Password, :Confirm_Password, :presence => true
  validates :Name, :length => { :minimum => 3}
  validates :Name, :uniqueness => { :message => "already taken" }
  validates :Phone_No, numericality: { only_integer: true } 
  validates :Email, format: {with: URI::MailTo::EMAIL_REGEXP }
  validate :checkpassword
  def checkpassword
  	if :Password != :Confirm_Password
  		errors.add(:Password, " and Confirm_Password doesn't match")
  	end
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  before_create :generate_authentication_token

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token    
  end
end

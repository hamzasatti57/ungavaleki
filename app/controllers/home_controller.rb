class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @account = Account.first
  end
end

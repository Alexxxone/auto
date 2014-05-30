class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @customers = Customer.where('created_at >= ?', Date.today-1).includes(:user, :payments)
  end
end
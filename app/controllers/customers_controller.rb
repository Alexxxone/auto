class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show,:edit, :update, :destroy]
  def index
    @customers = Customer.where('created_at >= ?', Date.today-1).includes(:user, :payments)
  end
  def show

  end
  private
  def set_customer
    @customer = Customer.find(params[:id])
  end
end
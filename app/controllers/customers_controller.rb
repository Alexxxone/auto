class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show,:edit, :update, :destroy]

  def index
    @customers = Customer.order('created_at DESC').includes(:user, :payments)
  end
  def show

  end

  def find_number_code
    q = params[:number_code]
    customers = Customer.where('lower(number_code) LIKE ?',"%#{q.downcase}%").limit(10)
    render json: customers
  end
  private
  def set_customer
    @customer = Customer.find(params[:id])
  end
end
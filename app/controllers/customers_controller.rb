class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show,:edit,  :update, :destroy]

  def index
    @customers = Customer.order('created_at DESC').includes(:user, :payments)
  end
  def show

  end
  def new
     @customer = current_user.customers.new
  end
  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id
    respond_to do |format|
      if @customer.save
        format.html { redirect_to  @customer, notice: 'Заказчик успешно создан!' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Заказчик успешно обновлен!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
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
    def customer_params
      params.require(:customer).permit(:name, :number_code)
    end
end
class Public::CustomersController < ApplicationController

  def show
  end

  def edit
  end

  def update
    current_customer.save
    redirect_to customers_path
  end

  def quit_check
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name)
  end

end

class Admin::HomesController < ApplicationController

  def top
    @order = current_customer.order

  end

  private



end

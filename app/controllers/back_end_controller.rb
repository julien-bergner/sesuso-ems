class BackEndController < ApplicationController
  before_filter :authenticate_user!

  def overview
    @customers = Customer.all
  end

end

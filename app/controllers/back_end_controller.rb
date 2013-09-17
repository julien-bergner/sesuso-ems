class BackEndController < ApplicationController
  before_filter :authenticate_user!

  def overview
    authorize! :show, :overview
    @customers = Customer.all
  end

end

class BackEndController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def overview
    @customers = Customer.all
  end

end

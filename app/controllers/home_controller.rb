class HomeController < ApplicationController
  before_action :fordid_login_user ,{only: [:index] }
  def index
  end
end

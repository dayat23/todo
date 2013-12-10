class AdminAppController < ApplicationController
  layout 'admin_app'
  before_action :authenticate_admin_user!
end

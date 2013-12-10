class PagesController < ApplicationController
  layout 'front_end'

  def index
  	if current_user
  		redirect_to user_dashboards_path
  	else
  		@index = "active"
  		respond_to do |format|
  		  format.html
  		end
  	end
  end

  def about
  	if current_user
  		redirect_to user_dashboards_path
  	else
  		@about = "active"
  		respond_to do |format|
  		  format.html
  		end
  	end
  end

  def contact_us
  	if current_user
  		redirect_to user_dashboards_path
  	else
  		@contact = "active"
  		respond_to do |format|
  		  format.html
  		end
  	end
  end
end

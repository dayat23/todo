class PagesController < FrontEndController

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

  def registration
    @role = Role.first
    @user = User.new(role_id: @role.id)
    @personal = @user.build_personal
  end
end

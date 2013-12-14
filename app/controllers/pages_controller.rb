class PagesController < FrontEndController

  def index
  	if current_user
      @personal = Personal.find_by_user_id(resource)
      @company_personal = CompanyPersonal.find_by_personal_id(@personal.id)
  		redirect_to user_index_path(id: @company)
  	else
  		@index = "active"
  		respond_to do |format|
  		  format.html
  		end
  	end
  end

  def about
  	if current_user
  		@personal = Personal.find_by_user_id(resource)
      @company_personal = CompanyPersonal.find_by_personal_id(@personal.id)
      redirect_to user_index_path(id: @company)
  	else
  		@about = "active"
  		respond_to do |format|
  		  format.html
  		end
  	end
  end

  def contact_us
  	if current_user
  		@personal = Personal.find_by_user_id(resource)
      @company_personal = CompanyPersonal.find_by_personal_id(@personal.id)
      redirect_to user_index_path(id: @company)
  	else
  		@contact = "active"
  		respond_to do |format|
  		  format.html
  		end
  	end
  end

  def registration
    if current_user
      @personal = Personal.find_by_user_id(resource)
      @company_personal = CompanyPersonal.find_by_personal_id(@personal.id)
      redirect_to user_index_path(id: @company)
    else
      @role = Role.first
      @user = User.new(role_id: @role.id)
      @personal = @user.build_personal
    end
  end
end

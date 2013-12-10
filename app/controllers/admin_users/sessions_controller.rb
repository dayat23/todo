class AdminUsers::SessionsController < Devise::SessionsController
  layout false
  # protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token
  
  def new
    super
    reset_session
  end
  
  def create
    resource = warden.authenticate!(:scope => resource_name)
    
    if resource
      set_flash_message :notice, :signed_in 
      sign_in_and_redirect(resource_name, resource)
      session[:current_admin_user_id] = resource
    else
      set_flash_message :alert
      redirect "new"
    end
  end

  def destroy
    session[:current_admin_user_id] = nil
    super
  end

  protected
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
end

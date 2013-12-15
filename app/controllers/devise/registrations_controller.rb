class Devise::RegistrationsController < DeviseController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]

  def new
    resource = build_resource({})
    respond_with resource
  end
  
  def create
    build_resource

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      # set_flash_message :notice, :same_email if is_navigational_format?
      # redirect_to new_web_user_registration_path
      # redirect_to root_path
      redirect_to registration_path
    end
  end

  protected
  def build_resource(hash=nil)
    hash ||= resource_params || {}
    self.resource = resource_class.new_with_session(hash, session)
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
    # redirect_to root_path
  end

  def after_inactive_sign_up_path_for(resource)
    respond_to?(:root_path) ? root_path : "/"
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id, personal_attributes: [:first_name, :company_name])
  end 
end

class FrontEndController < ActionController::Base
  layout 'front_end'
  protect_from_forgery with: :exception
end

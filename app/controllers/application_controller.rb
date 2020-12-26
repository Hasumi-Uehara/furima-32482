class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic_auth

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :first_name, :last_name, :first_name_reading, :last_name_reading,
                                             :birth_date])
  end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'hasmin' && password == '2222'
  #   end
  # end
end

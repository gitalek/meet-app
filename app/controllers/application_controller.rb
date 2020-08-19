class ApplicationController < ActionController::Base
  around_action :switch_locale

  # before_action :configure_permitted_parameters, if: :devise_controller?

  def switch_locale(&action)
    locale = extract_locale_from_subdomain || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:account_update) do |u|
  #     u.permit(:password, :password_confirmation, :current_password)
  #   end
  # end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  layout :layout_by_resource

  helper_method :is_arab



  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end

  def is_arab
     I18n.locale != I18n.default_locale
  end


  private

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end


  def after_sign_in_path_for(admin)
    admin_dashboard_path
  end

  def after_sign_out_path_for(admin)
    root_path
  end


  def layout_by_resource
    if devise_controller? && resource_name == :admin && action_name == 'new'
      "application"
    else
      "admin"
    end
  end


end

class ApplicationController < ActionController::Base
  # サインイン後のリダイレクト先を設定
  def after_sign_in_path_for(resource)
    my_page_path # マイページへのパス
  end

  # サインアウト後のリダイレクト先を設定
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # Deviseのサインアップやサインイン時に追加のパラメータを許可
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時に name を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント更新時にも許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end

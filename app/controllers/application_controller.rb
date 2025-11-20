class ApplicationController < ActionController::Base
  # サインイン後のリダイレクト先を設定
  def after_sign_in_path_for(resource)
    my_page_path # あとで作るマイページのパスに置き換え
  end

  # サインアウト後のリダイレクト先を設定
  def after_sign_out_path_for(resource_or_scope)
    root_path  # トップページにリダイレクト
  end
end

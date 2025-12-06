Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  # マイページ
  get 'my_page', to: 'users#my_page', as: 'my_page'
  # ユーザー詳細ページ
  get 'users/:id', to: 'users#show', as: 'user'
  # 投稿者名編集用ルート
  resource :user, only: [] do
    get 'edit_name', on: :collection    # 編集フォーム
    patch 'update_name', on: :collection # 更新処理
  end
  # 投稿
  resources :posts
  # 退会用ルート
  delete 'users/:id/destroy', to: 'users#destroy', as: 'destroy_user'
end

Rails.application.routes.draw do
    #実際に打つURL  =>  #コントローラで操作して飛ばされる先, as: このルートをこの名前で呼び出す
  get '/top' => 'homes#top'
  resources :lists

  # get 'lists/new' #最初の画面(新規投稿)----
  # post 'lists' => 'lists#create' #登録？
  # get 'lists' => 'lists#index' #投稿一覧----
  # get 'lists/:id' => 'lists#show', as: 'list' #詳細画面----
  #                                             #元々の「get lists/show」は削除。
  #                                             #URLの部分はidの前に:(コロン)を付けて
  #                                             #指定します。
  # get 'lists/:id/edit' => 'lists#edit', as: 'edit_list' # 編集画面----
  # patch 'lists/:id' => 'lists#update', as: 'update_list' #更新機能----
  # delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

CodykriegerCom::Application.routes.draw do
  root :to => 'home#index'
  
  match 'admin' => 'admin/dashboard#index'
  
  devise_for :users
  namespace "admin" do
    resources :users
  end
end

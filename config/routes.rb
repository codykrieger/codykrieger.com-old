CodykriegerCom::Application.routes.draw do
  scope :constraints => { :protocol => (Rails.env.production? ? "https" : "http") } do
    match 'admin' => 'admin/dashboard#index'
    devise_for :users
    namespace "admin" do
      resources :users
    end
  end
  
  match '/gfxCardStatus/*file.zip' => redirect("/downloads/%{file}.zip")
  match '/downloads(/*file)' => 'downloads#download_file'
  
  match '/compressify/support.html' => redirect("/compressify/support")
  
  match '/getintouch' => redirect("/contact")
  match '/work' => redirect("/about/work")
  match '/blog' => redirect("http://blog.codykrieger.com")
  match '/blog/*path' => redirect("http://blog.codykrieger.com/%{path}")
  
  root :to => 'home#index'
  
  match '/*slug' => 'pages#dynamic_page', :constraints => { :fullpath => /^\/(?!assets).+/ }
end

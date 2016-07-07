Rails.application.routes.draw do

  # get 'welcome/index'
  root 'page#welcome'
  get '/about'=>'page#about'
  #signup
  get 'users/signup' => 'users#signup', :as => 'signup'
  #login
  get 'users/login' => 'users#login', :as => 'login'
  #logout
  delete 'users/logout' => 'users#logout', :as => 'logout'
  #users
  resources :users ,only:[:create]
  post "create_login_session" => "users#create_login_session"
  #issue
  resources :issues
  # get 'issues/new' => 'issues#new'
  # patch 'issues/:id' => 'issues#update'
  # get '/issues/:id' => "issues#show", :as => "issue"
  # delete 'issues/:id' => 'issues#destroy'
  # get 'issues' => 'issues#index', :as => 'issues'
  # post 'issues' => 'issues#create'
  # get 'issues/:id/edit' => 'issues#edit', :as => 'edit_issue'

  # comments
  resources :comments,only:[:create]
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

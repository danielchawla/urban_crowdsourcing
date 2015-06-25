Rails.application.routes.draw do

  

  devise_for :users
 # devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

  # get 'suggestions' => 'suggestions#index'
  # get 'suggestions/new' => 'suggestions#new'
  # get 'suggestions/edit' => 'suggestions#edit'
  # get 'suggestions/map' => 'suggestions#map'
  get 'home' => 'homepages#index'
  # get 'suggestions/:id' => 'suggestions#show'

  # post 'suggestions' => 'suggestions#create'

  # get 'users' => 'users#index'
  # get 'users/new' => 'users#new'
  # get 'users/edit' => 'users#edit'
  # get 'users/:id' => 'users#show'

  # post 'users' => 'users#create'

  resources :users, :only => [:show, :index, :create, :new, :edit]
  resources :suggestions, :only => [:show, :index, :create, :new, :edit] do
     resources :comments, :only => [:index, :new, :create]
     member do
       #get :approve
       put :approve, as: :approve
       delete :destroy, as: :delete
       put :vote, as: :vote

    end   
   end
  
 
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

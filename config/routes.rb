SampleApp::Application.routes.draw do
  get "reviews/create"

  get "reviews/destroy"

  match "/ingredient_recipes/:id", to: 'ingredient_recipes#destroy'
  match "/ingredient_shopping_lists/:id", to: 'ingredient_shopping_lists#destroy'

  get "ingredient_shopping_lists/destroy"

  get "ingredient_users/destroy"

  get "ingredients/index"

  get "ingredients/show"

  get "ingredients/create"

  get "ingredients/destroy"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes, only: [:create, :destroy, :show, :index]
  resources :shopping_lists, only: [:create, :destroy, :show]
  resources :ingredients, only: [:create, :destroy, :show]
  resources :ingredient_users, only: [:destroy]
  resources :ingredient_recipes, only: [:destroy]
  resources :ingredient_shopping_lists, only: [:destroy]
  resources :reviews, only: [:create]
  
  root to: 'static_pages#home'
  
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/trololo', to: 'static_pages#trololo'
  match '/report', to: 'static_pages#report'
  match '/add_ingredient', to: 'ingredients#new_ingredient_user'
  match '/users/create_ingredient_user', to: 'ingredients#create_ingredient_user'
  match '/ingredients/create_ingredient_recipe', to: 'ingredients#create_ingredient_recipe'
  match '/ingredients/create_ingredient_shopping_list', to: 'ingredients#create_ingredient_shopping_list'
  match '/recipes_possible', to: 'users#recipes_possible'
  match '/recipes_expiring', to: 'users#recipes_exp'
  match '/ingredients_expiring', to: 'users#ingredients_exp'
  match '/create_review', to: 'reviews#create'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

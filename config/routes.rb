Nifty::Application.routes.draw do
  resources :participants

  resources :emails

  resources :tracks

  resources :posters

  resources :blocks
  resources :requests
  
  resources :friendships

  root :to => 'users#test'

  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup
  
  match 'test' => 'users#test', :as => :test

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login
  
  match 'newscheck' => 'news#checkDate', :as => :newscheck
  
  match 'getnews' => 'news#getnews', :as => :getnews
  
  match 'conferencedownload' => 'conferences#conferencedownload', :as => :conferencedownload
  
  match 'getallconferences' => 'conferences#getallconferences', :as => :getallconferences
  
  match 'getprofile' => 'users#getprofile', :as =>:getprofile
  
  match 'download_poster' => 'posters#download_poster', :as => :download_poster
  
  match 'download_poster_info' => 'posters#download_poster_info', :as => :download_poster_info
  
  match 'download_paper' => 'events#download_paper', :as => :download_paper
  
  match 'vote' => 'posters#vote', :as => :vote
  
  match 'getrequests' => 'users#getrequests', :as => :getrequests
  
  match 'makerequest' => 'users#makerequest', :as => :makerequest
  
  match 'rejectrequest' => 'users#rejectrequest', :as => :rejectrequest
  
  match 'removefriend' => 'users#removefriend', :as => :removefriend
  
  match 'confirm/:token' => 'users#confirm', :as => :confirm
  
  match 'getcontacts' => 'users#getcontacts', :as => :getcontacts

  resources :users
  
  resources :sessions
  
  resources :conferences do
	collection { post :import }
	collection { post :addUser }
	collection { post :removeUser }
	collection { post :addParticipant }
	collection { post :removeParticipant }
end
  
  resources :news

  resources :events

  resources :lecturers

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

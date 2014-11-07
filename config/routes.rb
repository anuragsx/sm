SmwSmw::Application.routes.draw do


  root :to => 'home#index'

  get 'home/:id' => 'home#admin'

  get 'admin_edit_listing/:id' => 'listings#admin_edit'

  get 'listings_admin/:id' => 'listings#admin'


  get 'login' => 'user_sessions#new', :as => :login

  get 'logout' => 'user_sessions#destroy', :as => :logout


  # password_reset "password_reset", :controller => "password_resets", :action => "new"
  # whatitsworth "whatitsworth", :controller => "home", :action => "whatitsworth"


  get 'searchautos' => 'autolistings#searchautos', :as => :searchautos
  get 'searchmotos' => 'motolistings#searchmotos', :as => :searchmotos
  get 'searchmarine' => 'marinelistings#searchmarine', :as => :searchmarine
  get 'searchpower' => 'powerlistings#searchpower', :as => :searchpower

  get 'about' => 'home#about', :as => :about

  # matt_bio "matt_bio", :controller => "home", :action => "matt_bio"
  # daniel_bio "daniel_bio", :controller => "home", :action => "daniel_bio"

  get 'contact' => 'home#contact', :as => :contact

  get 'faq' => 'home#faq', :as => :faq

  get 'whatiwant' => 'whatiwant#whatiwant', :as => :whatiwant

  resources :whatiwant do
    collection do
      get 'get_automodels'
      get 'get_marinesubcategories'
      get 'get_powersubcategories'
    end
  end

  get 'basicsearch' => 'listings#basicsearch', :as => :basicsearch

  get 'newmain' => 'listings#newmain', :as => :newmain

  #get 'newmain' => 'listings#newmain', :as => :newmain

  get 'photos/:id' => 'photos#showlarge', :as => :largephoto


  get 'medphoto/:id' => 'photos#showmedium', :as => :medphoto

  get 'smallphoto/:id' => 'photos#showsmall', :as => :smallphoto


  get 'inbox' => 'messages#inbox', :as => :inbox

  get 'sent' => 'messages#sent', :as => :sent

  resources :messages do
    member do
      delete 'deletesent'
      get 'reply'
      post 'create_reply'
    end
  end

  get 'privacypolicy' => 'home#privacypolicy', :as => :privacypolicy

  get 'visitoragreement' => 'home#visitoragreement', :as => :visitoragreement


  # forums "forums", :controller => :home, :action => :forums
  # autoemail "autoemail", :controller => :autoemail, :action => :index

   resources :wishlists do
     collection do
       get 'new_auto'
       get 'new_moto'
       get 'new_marine'
       get 'new_power'
     end
   end

   resources :favorites
   #resources :messages
   resources :users, :has_many=>:listings

   resources :users do
     resources :listings do

     end
   end

   resources :listings do
    resources :photos
   end

   resources :user_sessions

   resources :users, :shallow => true do
    resources :listings, :name_prefix => nil do
      resources :photos
    end
    resources :wishlists
    resources :favorites
  end

   resources :password_resets
   resources :autocategories
   resources :automodels
   resources :marinecategories do
     collection do
       get 'get_marinesubcategories'
     end
   end
   resources :marinemakes
   resources :motocategories
   resources :motomakes
   resources :powercategories do
     collection do
       get 'get_powersubcategories'
     end
   end
   resources :powermakes
   resources :autolistings do
     collection do
       post 'autolistingsresults'
       get 'get_automodels'
       post 'autolistingsresults_new'
       get 'autolistingsresults_new'
     end
   end

   resources :motolistings do
     collection do
       post 'motolistingsresults'
       get 'motolistingsresults'
     end
   end

   resources :marinelistings do
     collection do
       post 'marinelistingsresults'
       get 'marinelistingsresults'
     end
   end

   resources :powerlistings do
     collection do
       post 'powerlistingsresults'
       get 'powerlistingsresults'
     end
   end

   #connect ':controller/:action/:id'
   #connect ':controller/:action/:id.:format'




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   get 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   get 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
  # get ':controller(/:action(/:id))(.:format)'
end

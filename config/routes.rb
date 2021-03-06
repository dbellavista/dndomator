Dndomator::Application.routes.draw do
  resources :achievement_instances


  resources :achievements do
    collection do
      get 'list' => 'achievements#index', :list => true
    end
  end
  resources :quests do
    member do
      put 'success'
      put 'failure'
    end
  end


  resources :skill_challenges do
    member do
      put 'success'
      put 'failure'
    end
  end

  resources :treasures do
    member do
      match 'assign/:cid' => 'treasures#give', :as => :give, :method => :put
      put 'giveall'
    end
  end

  root :to => 'encounters#index'

  resources :items do
    collection do
      get 'auto_create'
    end
  end

  resources :encounters do
    member do
      put 'complete'
    end
  end

  resources :monsters do
    collection do
      get 'auto_create'
    end
  end

  resources :heros do
    collection do
      put 'assign_experience'
      get 'details' => 'heros#index', :details => true
    end
  end

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

Rails.application.routes.draw do



  resources :construction_equipment_categories
  resources :home_galleries


  resources :offshore_facilities do
    collection do
      get :appindex
    end
  end
  resources :construction_equipments do
    collection do
      get :appindex
    end
  end
  resources :onshore_yards do
    collection do
      get :appindex
    end
  end



  resources :gadgets do
    member do
      get :appshow
    end
  end

  resources :feedbacks
  devise_for :admins

  get 'admin' => 'admin#dashboard'
  get 'admin/dashboard'
  get 'admin/news_index'
  get 'admin/visits'

  resources :projects do
    collection do
      get :appindex
    end
    member do
      get :appshow
    end
  end

  resources :news do
    collection do
      get :appindex
    end
    member do
      get :appshow
    end
  end

  scope "(:locale)", :locale => /en|ar/ do

    root 'main#home'

    get 'main/home'
    get 'main/about_us'
    get 'main/gallery'
    get 'main/contact_us'
    get 'main/stack_holders'
    get 'main/news'
    get 'main/success'
    get 'main/search'

    get 'main/onshore_activities'
    get 'main/offshore_activities'
    get 'main/powerplant_activities'

  end




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

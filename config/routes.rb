Alanya::Application.routes.draw do



  get "sitemap" => "sitemap#index"

  match 'reservations' => 'reservations#index'


  get "search" => "search#index"

  resources :about_pages, path: 'about'


  # resources :contact_messages


  get 'contacts' => 'contacts#index'
  post 'contacts' => 'contacts#send_message'
  get 'contacts/map'
  get 'contacts/thanks'

  resources :turkey_news, path: 'turkey', only: [:index, :show] do
    collection do
      resources :cities, only: :show, on: :collection

    end
  end

  match 'news' => 'turkey_news#index', format: :atom, constraints: { format: /rss|atom/ }


  resources :services, only: [:index, :show] do
    collection do
      resources :transfer, only: [:index, :create] do
        get 'thanks', on: :collection
      end
    end
  end


  mount RedactorRails::Engine => '/redactor_rails'

  Property::ACTIONS.each do |action|
    scope action.to_s, as: action do
      resources :properties, only: [:show] do
        get 'map', on: :member, as: :map
        match 'offer', on: :member, as: :offer
      end
      match 'search' => 'properties#search', as: :search, property_for: action
      get '' => 'properties#index', property_for: action
    end
  end
  get 'properties/offer_thanks'

  # get "rent" => "rent#index", as: :rent

  # scope 'rent' do
  # resources :properties
  # end

  # resources :properties
  # resources :cities

  devise_for :admin, controllers: {sessions: 'admin/sessions'}
  namespace :admin do
    get :dashboard
    resources :reservations #, only: [:index, :show]
    resources :properties do
      resources :photos
      resources :reservations
      collection do
        resources :property_attributes do
          collection do
            post 'sort'
          end
        end
      end
    end
    resources :cities do
      resources :photos
      resources :sliders do
        post 'sort', on: :collection
      end
    end
    resources :services do
      match 'settings' => 'settings#edit', as: :page_settings, settings_type: :service_page
    end
    resources :turkey_news do
      collection do
        resources :sliders, slider_type: 'turkey_news', as: :turkey_news_sliders do
          post 'sort', on: :collection
        end
      end
    end
    match 'about_pages/settings' => 'settings#edit', as: :about_pages_settings, settings_type: :about_pages
    resources :about_pages do
      match 'settings' => 'settings#edit', as: :settings, settings_type: :about_page
      collection do
        resources :sliders, slider_type: 'about_pages', as: :about_pages_sliders do
          post 'sort', on: :collection
        end
      end
    end
    scope 'contacts' do
      # collection do
      resources :contact_people, path: 'people'
      resources :contact_topics, path: 'topics'
      # end
      match 'settings' => 'settings#edit', as: :contacts_settings, settings_type: :contacts
    end
    scope 'settings' do
      resources :sliders, slider_type: 'main', as: :main_sliders do
        post 'sort', on: :collection
      end
      match 'global' => "settings#edit", settings_type: 'global', as: :global_settings
      match 'main' => "settings#edit", settings_type: 'main', as: :main_settings
      ['buy', 'rent', 'transfer', 'reservation'].each do |settings_for|
        match settings_for => 'settings#edit', as: :"#{settings_for}_settings", settings_type: settings_for
      end
    end
    resources :banners
    get '', action: :index
  end

  root to: 'welcome#index'

  match '404' => "errors#not_found"
  match '500' => "errors#internal_error"

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
  #   resources :products do'
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

Rails.application.routes.draw do
    
    # Devise routes
    devise_for :users, :controllers => { registrations: 'registrations' }
    
    # Root route
    root 'welcome#index', as: "home_page"
    
    # User routes
    get     '/users'            => 'users#index', as:  'users'
    get     '/users/new'        => 'users#new', as: 'new_user'
    post    '/users'            => 'users#create'
    get     '/users/:id'        => 'users#show', as: 'user'
#    get     '/users/:id/edit'   => 'users#edit', as: 'edit_user'
    put     '/users/:id'        => 'users#update'
    patch   '/users/:id'        => 'users#update'
    delete  '/users/:id'        => 'users#destroy'
    
    # Job routes
    get     '/jobs'             => 'jobs#index', as:  'jobs'
    get     '/jobs/new'         => 'jobs#new', as: 'new_job'
    post    '/jobs'             => 'jobs#create'
    get     '/jobs/:id'         => 'jobs#show', as: 'job'
    get     '/jobs/:id/edit'    => 'jobs#edit', as: 'edit_job'
    put     '/jobs/:id'         => 'jobs#update'
    patch   '/jobs/:id'         => 'jobs#update'
    delete  '/jobs/:id'         => 'jobs#destroy'
    
    # Boat routes
    get     '/boats'            => 'boats#index', as:  'boats'
    get     '/boats/new'        => 'boats#new', as: 'new_boat'
    post    '/boats'            => 'boats#create'
    get     '/boats/:id'        => 'boats#show', as: 'boat'
    get     '/boats/:id/edit'   => 'boats#edit', as: 'edit_boat'
    put     '/boats/:id'        => 'boats#update'
    patch   '/boats/:id'        => 'boats#update'
    delete  '/boats/:id'        => 'boats#destroy'
    
    
    resources :jobs do
        member do
            get :workers     
        end
    end
    
    resources :boats do
        member do
            get :tasks     
        end
    end
    
    resources :assignments,     only: [:create, :destroy]
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

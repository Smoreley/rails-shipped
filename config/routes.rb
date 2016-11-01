Rails.application.routes.draw do
    
    # Devise routes
    devise_for :users
    
    
    # Root route
    root 'users#index', as: "home_page"
    
    # User routes
#    get     '/users'           => 'users#index', as:  'user'
    get     '/users/new'        => 'users#new', as: 'new_user'
    post    '/users'            => 'users#create'
    get     '/users/show'       => 'users#show', as: 'user'
    get     '/users/edit'       => 'users#edit', as: 'edit_user'
    put     '/users/update'     => 'users#update'
    delete  '/users/destroy'    => 'users#destroy'
    
    # Job routes
    get     '/jobs'             => 'jobs#index', as:  'job'
    get     '/jobs/new'         => 'jobs#new', as: 'new_job'
    post    '/jobs'             => 'jobs#create'
#    get     '/jobs/:id'         => 'jobs#show', as: 'job'
    get     '/jobs/:id/edit'    => 'jobs#edit', as: 'edit_job'
    put     '/jobs/:id'         => 'jobs#update'
    delete  '/jobs/:id'         => 'jobs#destroy'
    
    # Boat routes
    get     '/boats'            => 'boats#index', as:  'boat'
    get     '/boats/new'        => 'boats#new', as: 'new_boat'
    post    '/boats'            => 'boats#create'
#    get     '/boats/:id'        => 'boats#show', as: 'boat'
    get     '/boats/:id/edit'   => 'boats#edit', as: 'edit_boat'
    put     '/boats/:id'        => 'boats#update'
    delete  '/boats/:id'        => 'boats#destroy'

    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

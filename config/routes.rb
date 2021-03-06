Rails.application.routes.draw do

  devise_for :users
  resources :benzodiazepines, only: [:index, :show]
  resources :cannabinoids, only: [:index, :show]
  resources :stimulants, only: [:index, :show]
  resources :psychedelics, only: [:index, :show]
  resources :dissociatives, only: [:index, :show]
  resources :opiates, only: [:index, :show]
  resources :reports
  resources :home, :only => [:index]
  resources :votes
  resources :drugs
  root to: "home#index"

  resources :static

  namespace :admin do
    resources :alerts
    resources :benzodiazepines
    resources :cannabinoids
    resources :dissociatives
    resources :psychedelics
    resources :metabolites
    resources :opiates
    resources :stimulants
    resources :dashboard
    resources :posts
    resources :keywords
    resources :drug_forms

    resources :drugs do
      resources :effects
    end

  end


  namespace :moderator do
    resources :reports
  end

  namespace :api do

    namespace :v1 do

      resources :drugs

    end

  end

  resources :alerts

end

# frozen_string_literal: true

Rails.application.routes.draw do
  resources :links, param: :short_url_id

  get '/:short_url_id' => 'links#show'

  root 'links#index'
end

Rails.application.routes.draw do
  get 'advertisers/index' => 'advertisers#index'
  
  get 'products/index'=> 'products#index'

  get 'products/import' => 'products#import'
end

Rails.application.routes.draw do

root 'static_pages#home'
get  '/help',    to: 'static_pages#help'
get  '/home',    to: 'static_pages#home'
get  '/signup',  to: 'users#new'
end
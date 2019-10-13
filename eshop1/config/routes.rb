Rails.application.routes.draw do

root :to => 'catalog#index'

get 'about' => 'about#index'
get 'catalog' => 'catalog#index'
get 'checkout' => 'checkout#index'
get 'admin/developer' => 'admin/developer#index'
get 'admin/supplier' => 'admin/supplier#index'
get 'admin/game' => 'admin/game#index'
get 'admin/order' => 'admin/order#index'

get 'about/index'

get 'admin/developer/new'
post 'admin/developer/create'
get 'admin/developer/edit'
post 'admin/developer/update'
post 'admin/developer/destroy'
get 'admin/developer/show'
get 'admin/developer/show/:id' => 'admin/developer#show'
get 'admin/developer/index'

get 'admin/supplier/new'
post 'admin/supplier/create'
get 'admin/supplier/edit'
post 'admin/supplier/update'
post 'admin/supplier/destroy'
get 'admin/supplier/show'
get 'admin/supplier/show/:id' => 'admin/supplier#show'
get 'admin/supplier/index'

get 'admin/game/new'
post 'admin/game/create'
get 'admin/game/edit'
post 'admin/game/update'
post 'admin/game/destroy'
get 'admin/game/show'
get 'admin/game/show/:id' => 'admin/game#show'
get 'admin/game/index'

post 'admin/order/close'
post 'admin/order/destroy'
get 'admin/order/show'
get 'admin/order/show/:id' => 'admin/order#show'
get 'admin/order/index'

get 'catalog/show'
get 'catalog/show/:id' => 'catalog#show'
get 'catalog/index'
get 'catalog/latest'
get 'catalog/rss'


get 'cart/add'
post 'cart/add'
get 'cart/remove'
post 'cart/remove'
get 'cart/clear'
post 'cart/clear'

get 'user_sessions/new'
get 'user_sessions/create' # for showing failed login screen after restarting web server
post 'user_sessions/create'
get 'user_sessions/destroy'

get 'user/new'
post 'user/create'
get 'user/show'
get 'user/show/:id' => 'user#show'
get 'user/edit'
post 'user/update'

get 'checkout/index'
post 'checkout/submit_order'
get 'checkout/thank_you'

get 'password_reset/new'
post 'password_reset/create'
get 'password_reset/edit'
post 'password_reset/update'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

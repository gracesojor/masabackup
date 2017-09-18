Rails.application.routes.draw do

  get 'pay_relationship/create'

  get 'pay_relationship/destroy'

root 'static_pages#home'
#トップページの設定

get '/money', to:'static_pages#help', as:'help'
get '/bss/:id/', to:'static_pages#edit', as:'edit'



get '/about', to: 'static_pages#about' ,as:'about'
get '/contact', to: 'static_pages#contact' ,as:'contact'
#static_pagesはresourcesがないから、１つずつ設定しないといけない

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
#userでsignupというアドレスを作る

get '/login', to:'sessions#new'
post '/login', to:'sessions#create'
delete '/logout', to:'sessions#destroy'
#sessionsでlogin、logoutというアドレスを作る


get '/', to:'sells#new'
post '/', to:'sells#create'
delete '/', to:'sells#destroy'

#get '/admin/money', to:'bank#users'



resources :users do
    member do
      get :following, :followers
    end
  end
#”フォロー”に関する各、フォロワー・被フォロワーの個別ページに飛べる設定
#この設定で、memberメソッドを使うとユーザーidが含まれているURLを扱うようになる
#memberは条件分岐するための予約ワード

# memberの能力
# URLは２つ、ファイルは１つ
# ①コントローラーで飛ぶURLと同じ名前、memberのgetと同じ名前、のmethodを書く、
# ②情報を挙列させると、カスタムフィールドのように、部分的に別の表示をさせることができる


# get :following, :followers - user/followingとuser/followers というファイルを作る

resources :sells

resources :banks

resources :bank_historys

resources :static_pages

resources :details

resources :makers

resources :microposts, only: [:create, :destroy]

resources :relationships, only: [:create, :destroy]

resources :account_activations, only: [:edit]
#メール認証

resources :password_resets,     only: [:new, :create, :edit, :update]




# ★ = plural
# get '/★', to:'★#index'
# /★のURLにアクセスしたら、
#controllerの★#indexを作動させる
#２つの★が同一な時のみto:の省略化。

# get '/★/new', to:'★#new', as:'new_ ★(s)' 
# post '/★', to:'★#create'
# get '/★/:id', to:'★#show', as:'user'
# get '/★/:id/edit', to:'★#edit', as:'edit_★(s)'
# patch '/★/:id', to:'★#update'
# put '/★/:id', to:'★#update'
# delete '/★/:id', to:'★#destroy'

#↓add original action
# resources :★ do
#    member do
#     post '★original★'
#    end
#  end


#get 'sessions/new'
end
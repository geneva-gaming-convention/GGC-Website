Rails.application.routes.draw do

  # Welcome -------------------
  root  'welcome#index'
  get   'commits'                    => 'welcome#get_commits'
  # ---------------------------

  # Users ---------------------
  resources :users do
    get     'delete'                 => 'users#delete'
    put     'phone'                  => 'users#update_phone'
    delete  'phone'                  => 'users#delete_phone'
  end
  get   'validate/:token'            => 'users#validate',                       as: :validate
  # ---------------------------

  # Reset password ------------
  get   'reset_password'             => 'reset_password#ask_reset_password',    as: :ask_rst_passwd
  post  'send_new_password'          => 'reset_password#send_new_password',     as: :send_new_passwd
  get   'config_new_password/:token' => 'reset_password#config_new_password',   as: :conf_new_passwd
  patch 'reset_password/:token'      => 'reset_password#reset_password',        as: :rst_passwd
  # ---------------------------

  # Addresses -----------------
  resources :addresses
  post 'validate_addr'               => 'addresses#get_valid_addr'
  # ---------------------------

  # Events --------------------
  resources :events
  # ---------------------------

  # Statics pages -------------
  get     'faq'                      => 'static#faq'
  # ---------------------------

  # Sessions ------------------
  get     'login'                    => 'sessions#new'
  post    'login'                    => 'sessions#create'
  delete  'logout'                   => 'sessions#destroy'
  # ---------------------------

end

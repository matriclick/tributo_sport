# encoding: UTF-8
Matri::Application.routes.draw do

  # This is one way to implement the "channel.html" file recommended by facebook. Your application.html.erb should have something like "channelUrl : '//www.tributosport.com/channel.html'"
  get '/channel.html' => proc {
    [
      200,
      {
        'Pragma'        => 'public',
        'Cache-Control' => "max-age=#{1.year.to_i}",
        'Expires'       => 1.year.from_now.to_s(:rfc822),
        'Content-Type'  => 'text/html'
      },
      ['<script type="text/javascript" src="//connect.facebook.net/en_US/all.js"></script>']
    ]
  }

  scope ":country_url_path" do # BEGINING OF SCOPE COUNTRY_URL_PATH
    get "mail_inline/i_want_it/:dress_id" => 'mail_inline#i_want_it', :as => 'mail_inline_i_want_it'
    post "mail_inline/send_i_want_it" => 'mail_inline#send_i_want_it'

    post 'buy/add_to_cart' => 'buy#add_to_cart'
    post 'buy/remove_from_cart' => 'buy#remove_from_cart'
    post 'buy/success_transfer' => 'buy#success_transfer'
    post 'buy/success_full_credit' => 'buy#success_full_credit'

    match 'buy/index' => 'buy#index', :via => [:get, :post]
    match 'buy/notify' => 'buy#notify', :via => [:get, :post]
    match 'buy/success' => 'buy#success', :via => [:get, :post]
    match 'buy/failure' => 'buy#failure', :via => [:get, :post]
    
    match 'buy/confirm' => 'buy#confirm', :via => [:get, :post]
    match 'buy/details' => 'buy#details', :via => [:get, :post]
    match 'buy/view_cart' => 'buy#view_cart', :via => [:get, :post]
    put 'buy/refresh_cart' => 'buy#refresh_cart'

    match 'notify' => 'buy#notify', :via => [:get, :post]
    match 'success' => 'buy#success', :via => [:get, :post]
    match 'failure' => 'buy#failure', :via => [:get, :post]

    get 'adyen' => 'buy#adyen'
    
    resources :sizes do 
      collection do 
        put 'update_multiple'
      end 
    end
    
    resources :delivery_infos

    get 'purchases/show_for_user/:id' => 'purchases#show_for_user', as: 'purchases_show_for_user'
    get 'purchases/refund_credit' => 'purchases#refund_credit'
    post 'purchases/generate_refund_credit' => 'purchases#generate_refund_credit'
    resources :purchases
  
    get "gift_cards/gift_card_codes" => 'gift_cards#gift_card_codes', as: 'gift_cards_gift_card_codes'
    get "gift_cards/mark_used_code" => 'gift_cards#mark_used_code', as: 'gift_cards_mark_used_code'
    get "gift_cards/mark_bought_code" => 'gift_cards#mark_bought_code', as: 'gift_cards_mark_bought_code'
    get "gift_cards/add_dresses" => 'gift_cards#add_dresses', as: 'gift_cards_add_dresses'
    get "gift_cards/view_coupon" => 'gift_cards#view_coupon', as: 'gift_cards_view_coupon'
    get "gift_cards/show_coupon/:id" => 'gift_cards#show_coupon', as: 'gift_cards_show_coupon'
    post "gift_cards/update_dresses" => 'gift_cards#update_dresses', as: 'gift_cards_update_dresses'
    resources :gift_cards
    
    get "reports/salestool" => "reports#salestool"
    get "reports/export" => "reports#export"
    get "reports/export_dress_info" => "reports#export_dress_info"
    get "reports/users" => "reports#users"
    get "reports/suppliers" => "reports#suppliers"
    get "reports/activity_details" => "reports#activity_details"
    get "reports/contracts_expiration" => "reports#contracts_expiration"
    get "reports/contracts_details" => "reports#contracts_details"
    get "reports/industry_category_details" => "reports#industry_category_details"
    get "reports/conversations_details" => "reports#conversations_details"
    get "reports/conversations_without_reply" => "reports#conversations_without_reply"
    get "reports/dresses" => "reports#dresses"
    get "reports/dresses_details" => "reports#dresses_details"
    get "reports/contracts" => "reports#contracts"
    get "reports/invoices" => "reports#invoices"
    get "reports/invoices_details" => "reports#invoices_details"
    get "reports/collections" => "reports#collections"
    get "reports/expected_flow" => "reports#expected_flow"
    get "reports/invoices_list" => "reports#invoices_list"
    get "reports/debtor_list" => "reports#debtor_list"
    get "reports/collections_email" => "reports#collections_email"
    get "reports/suppliers_with_contract" => "reports#suppliers_with_contract"
    get "reports/user_conversations" => "reports#user_conversations"
    get "reports/list_user_conversations" => "reports#list_user_conversations"
    get "reports/purchases" => "reports#purchases"
    resources :lead_contacts
    resources :challenge_activities
    resources :challenges
    resources :leads  
    resources :matriclickers

    resources :invoices
    get 'invoices/download_file/:attached_file' => 'invoices#download_file', as: 'invoices_download_file'
    resources :contracts
    get 'contracts/download_file/:attached_file' => 'contracts#download_file', as: 'contracts_download_file'
				
    resources :reserved_dates

    put "slider_images/update_positions" => "slider_images#update_positions"
    resources :slider_images
    resources :opportunities

  	# DRESSES
  	get "dresses/display_dispatch_costs" => 'dresses#display_dispatch_costs', as: 'display_dispatch_costs'
  	
  	get "contacto-tributosport" => 'dresses#contact_elbazar', as: 'contact_elbazar'
  	get "faq-tributosport" => 'dresses#faq_elbazar', as: 'faq_elbazar'
  	  	
  	get 'dresses/set_stock/:id' => 'dresses#set_stock', as: 'dresses_set_stock'
  	post 'dresses/update_stock' => 'dresses#update_stock', as: 'dresses_update_stock'
  	post 'dresses/notify_request/:slug' => 'dresses#notify_request', as: 'dresses_notify_request'
  	get 'dresses/dress_request/:slug' => 'dresses#dress_request', as: 'dresses_dress_request'
  	
  	get "dresses/ver/:type" => 'dresses#view', as: 'dresses_ver'
  	post "dresses/ver/dresses/endless_scrolling" => 'dresses#endless_scrolling', as: 'dresses_endless_scrolling'
  	resources :dresses, :except => ['show']
	  get 'dresses/:type/:slug' => 'dresses#show', :as => 'dress_ver'
	  get 'dresses/buscar' => 'dresses#view_search', :as => 'dresses_search'
	  post "dresses/dresses/endless_scrolling" => 'dresses#endless_scrolling'
	  
	  get 'dresses/refund_policy'	=> 'dresses#refund_policy', as: 'refund_policy'
	  resources :refund_requests
    resources :cloth_measures	    
  	resources :mailings
  	# BLOG
    resources :posts do
  		resources :blog_comments  	
    end
    get 'blog' => 'posts#blog'
  
  	# PACKS
    get 'blog-tributosport' => 'packs#el_bazar', as: 'blog_el_bazar'
    resources :contacts
      
    # USER_PROFILE
    get 'user_profile'											=> 'user_profile#purchases',					as: 'user_profile'
    get 'user_profile/personalizacion'			=> 'user_profile#personalization',		as: 'user_profile_personalization'
    get 'user_profile/estilos'		        	=> 'user_profile#edit_tags',	      	as: 'user_profile_edit_tags'
    put "user_profile/update_tags"          => "user_profile#update_tags",        as: 'user_profile_update_tags'

    devise_for :suppliers

  	devise_scope :supplier do
  		match '/supplier_login' => "devise/sessions#new"
  	end

  	devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :registrations => 'users/registrations' }

    devise_scope :user do
      match '/user_sign_up' => "devise/registrations#new"
    end

  	resources :suppliers do
  		resource :supplier_account, as: :account do
  			# CONVERSATIONS
  			get 'conversations' => 'conversations#index', as: 'conversations'
  			get 'conversations/download_file/:attached_file' => 'conversations#download_file', as: 'conversations_download_file'
  			# ALBUMS
      	resources :albums
  			# DRESSES
      	resources :dresses, :except => ['index']
      	get "dresses" => 'dresses#supplier_view', as: 'dresses'
      	match "dresses/ver/dresses/endless_scrolling" => 'dresses#endless_scrolling', as: 'dresses_endless_scrolling'
        get 'dresses/set_stock/:id' => 'dresses#set_stock', as: 'dresses_set_stock'
      	post 'dresses/update_stock' => 'dresses#update_stock', as: 'dresses_update_stock'
  	  	post "dresses/endless_scrolling" => 'dresses#endless_scrolling'
  			# GIFT CARDS
        resources :gift_cards
  			# STATISTICS
  			get 'statistics' => 'statistics#index', as: 'statistics'
  			# NO MORE BOOKINGS
  			get 'calendar'  => 'supplier_accounts#calendar', as: 'calendar'
  		  get 'reserve_date'  => 'supplier_accounts#reserve_date', as: 'reserve_date'
  			resources :supplier_contacts
  			resources :products	do
  				match '/update_multiple' => 'product_images#update_multiple', as: '/update_multiple'
  				resources :product_images do
  					member do
  						put "set_image_index" => 'product_images#set_image_index', as: 'set_image_index'
  						put "toggle_active" => 'product_images#toggle_active', as: 'toggle_active'
  					end
  				end
				
  			end
  			resource :presentation do
  				resources :presentation_images
  			end
  			resources :services do
  				match '/update_multiple' => 'service_images#update_multiple', as: '/update_multiple'
  	      resources :service_images do
  					member do
  						put "set_image_index" => 'service_images#set_image_index', as: 'set_image_index'
  						put "toggle_active" => 'service_images#toggle_active', as: 'toggle_active'
  					end
  				end
  			  resources :schedules
  	    end
  		end
  	end
    resources :product_types, :industry_categories, :contact_types, :users, :feedbacks, :invitee_groups, :invitations
	
	
  	# FGM Routes for the home controller (non-RESTful)
		match '/welcome' => "home#index"
		get '/terms' => "home#terms"
		get '/company' => "home#company"
		get '/faq' => "home#faq"
		get '/criteria' => "home#criteria"
		get '/como_nace' => "home#como_nace"
		get '/press' => "home#press"
		get '/work_with_us' => "home#work_with_us"
		get '/tour' => "home#tour"
		get '/wedding_tools' => "home#wedding_tools"
		get '/marry_me' => "home#marry_me"
		get '/test-home' => "home#test_home"
		get '/suscribirse' => 'home#subscription', as: 'subscription'
		post '/subscription_create' => 'home#subscription_create',	 as: 'subscription_create'	

  	match '/supplier/main' => "supplier_accounts#show", as: :supplier_home
	
  	scope ':public_url' do #DZF this alows to search a supplier without crashing with resources in the "/ "
  		root :to => "suppliers_catalog#supplier_description"
  	end

    # ADMINISTRATION
    get "administration/index" => "administration#index"
    get "administration" => "administration#index"
    get "administration/webpage_contacts" => 'administration#webpage_contacts', as: 'administration_webpage_contacts'  
    get "administration/old_dresses" => 'administration#old_dresses', as: 'administration_old_dresses'
    get "administration/dresses" => 'administration#dresses', as: 'administration_dresses'
    get "administration/dress" => 'administration#dress', as: 'administration_dress'
    get "administration/dresses_list" => 'administration#dresses_list', as: 'administration_dresses_list'
    get "administration/view_old_dress" => "administration#view_old_dress"
    get "administration/suppliers_list" => "administration#suppliers_list"
    get "administration/show_supplier_account/:id" => 'administration#show_supplier_account', as: 'administration_show_supplier_account'
    get "administration/show_supplier_products/:id" => 'administration#show_supplier_products', as: 'administration_show_supplier_products'
    get "administration/show_supplier_services/:id" => 'administration#show_supplier_services', as: 'administration_show_supplier_services'
    get "administration/edit_supplier_account/:supplier_account_id" => 'administration#edit_supplier_account', as: 'administration_edit_supplier_account'
    get "administration/reset_supplier_password/:supplier_account_id" => 'administration#reset_supplier_password', as: 'administration_reset_supplier_password'
    get "administration/edit_supplier_product/:product_id" => 'administration#edit_supplier_product', as: 'administration_edit_supplier_product'
    get "administration/edit_supplier_service/:service_id" => 'administration#edit_supplier_service', as: 'administration_edit_supplier_service'
    get "administration/edit_dispatch_costs" => 'administration#edit_dispatch_costs', as: 'administration_edit_dispatch_costs'
    put "administration/update_dispatch_costs" => 'administration#update_dispatch_costs', as: 'administration_update_dispatch_costs'
    put "administration/update_supplier_account/:id" => 'administration#update_supplier_account', as: 'administration_update_supplier_account'
    put "administration/update_supplier_product/:id" => 'administration#update_supplier_product', as: 'administration_update_supplier_product'
    put "administration/update_supplier_service/:id" => 'administration#update_supplier_service', as: 'administration_update_supplier_service'
    delete "administration/destroy_old_dress/:id" => 'administration#destroy_old_dress', as: 'administration_destroy_old_dress'
    delete "administration/destroy_supplier/:id" => 'administration#destroy_supplier', as: 'administration_destroy_supplier'
    delete "administration/destroy_supplier_product/:id" => 'administration#destroy_supplier_product', as: 'administration_destroy_supplier_product'
    delete "administration/destroy_supplier_service/:id" => 'administration#destroy_supplier_service', as: 'administration_destroy_supplier_service'

    # ADMINISTRATION REVIEWS
    get	"administration/reviews" => "administration#reviews"
    get "administration/new_review/:id" => "administration#new_review", as: "administration_new_review"
    get "administration/edit_review/:id" => "administration#edit_review", as: "administration_edit_review"
    put "administration/update_review/:id" => "administration#update_review", as: "administration_update_review"
    delete "administration/destroy_review/:id" => "administration#destroy_review", as: "administration_destroy_review"
    
    # ADMINISTRATION PACK PROMOTIONS
    scope 'administration' do
      resources :pack_promotions do 
        collection do 
          put 'update_multiple'
        end 
      end
  	end
  	
  	get "administration/mailing-tools" => "administration#mailing_tools", as: 'administration_mailing_tools'
  	get "administration/mailing_sent" => "administration#mailing_sent", as: 'administration_mailing_sent'
    	      
  end # ENDING OF SCOPE COUNTRY_URL_PATH
  
  match ':country_url_path' => 'dresses#bazar', as: :root_country
  match ':country_url_path' => 'dresses#bazar', as: 'bazar'
  root :to => "dresses#bazar"

  #SEO: Realiza match con archivo routes.yml para cambio de nombre (alias) a la ruta - HAY QUE DEJARLO AL FINAL
  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
  
end

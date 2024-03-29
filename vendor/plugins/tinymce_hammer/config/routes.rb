if Rails.version =~ /^3/

  # newer rails 3.0+ compat routes
  Rails.application.routes.draw do
    scope ":country_url_path" do # BEGINING OF SCOPE COUNTRY_URL_PATH
      match '/javascripts/tinymce_hammer.js' => 'tinymce/hammer#combine', :as => 'tinymce_hammer_js'
    end # ENDING OF SCOPE COUNTRY_URL_PATH
  end

else

  # older 2.3+ compat routes
  ActionController::Routing::Routes.draw do |map|
    map.tinymce_hammer_js '/javascripts/tinymce_hammer.js', 
      :controller => 'tinymce/hammer',
      :action => 'combine'
  end

end


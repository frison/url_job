Rails.application.routes.draw do |map|
   match '/uj/:token', :action => 'perform', :controller => "UrlJob/UrlJob"
end
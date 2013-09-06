if Rails.env == "production"
	ENV['fb_app_id'] = "FILL IN" 
	ENV['fb_secret'] = "FILL IN"
else
	ENV['fb_app_id'] = '343629322437383'
	ENV['fb_secret'] = '7e510c5b72f620481bf44d5873914161'
end

ENV['fb_permissions'] = "email" # e.g. create_event, user_groups, publish_stream

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['fb_app_id'], ENV['fb_secret'], scope: ENV['fb_permissions'], client_options: { :ssl => { :ca_file => '/usr/lib/ssl/certs/ca-certificates.crt' } }
end
class ApplicationController < ActionController::Base
	include PublicActivity::StoreController
	rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = "Access Denied"
		redirect_to root_url
	end
end

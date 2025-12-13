class ApplicationController < ActionController::Base
  # before_action :disable_turbo_for_devise

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # private

  # def disable_turbo_for_devise
  #   return unless devise_controller?

  #   response.headers["Turbo-Visit-Control"] = "reload"
  # end
end

module JsFunOnRails
  class Engine < Rails::Engine
    config.to_prepare do
      ApplicationController.helper(JsFunOnRailsHelper)
    end
  end
end
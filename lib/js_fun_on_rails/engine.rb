module JsFunOnRails
  module MyEngineHelper
    def blabla
        link_to_function("BLABLA", "alert('Jello world')")
    end
  end
  
  class Engine < Rails::Engine
    config.to_prepare do
      ApplicationController.helper(MyEngineHelper)
    end
  end
end
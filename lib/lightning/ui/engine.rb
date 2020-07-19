module Lightning
  module UI
    class Engine < ::Rails::Engine
      isolate_namespace Lightning::UI

      initializer "lightning-ui.helpers" do
        ActiveSupport.on_load :action_controller do
          ::ActionController::Base.helper Lightning::UI::Engine.helpers
        end
      end

      initializer "lightning-ui.assets.precompile" do |app|
        app.config.assets.precompile += Dir["#{root}/app/assets/images/**/*.svg"]
      end
    end
  end
end

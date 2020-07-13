module Lightning
  module UI
    class Engine < ::Rails::Engine
      isolate_namespace Lightning::UI

      initializer "lightning-ui.helpers" do
        ActiveSupport.on_load :action_controller do
          ::ActionController::Base.helper Lightning::UI::Engine.helpers
        end
      end
    end
  end
end

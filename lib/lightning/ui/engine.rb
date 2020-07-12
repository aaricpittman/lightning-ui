module Lightning
  module UI
    class Engine < ::Rails::Engine
      isolate_namespace Lightning::UI
    end
  end
end

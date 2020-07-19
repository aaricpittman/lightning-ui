module Lightning
  module UI
    module ComponentsHelper
      def lightning_badge(text: nil, color: :default, &block)
        render(BadgeComponent.new(text: text, color: color), &block)
      end

      def lightning_icon(color: :default, name:, text: nil, type:, size: :default)
        render(IconComponent.new(color: color, name: name, text: text, type: type, size: size))
      end
    end
  end
end
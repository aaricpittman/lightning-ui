module Lightning
  module UI
    module ComponentsHelper
      def lightning_badge(text: nil, color: :default, &block)
        render(BadgeComponent.new(text: text, color: color), &block)
      end
    end
  end
end
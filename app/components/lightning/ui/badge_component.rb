module Lightning
  module UI
    class BadgeComponent < ApplicationComponent
      COLORS = {
        default: nil,
        inverse: 'slds-badge_inverse',
        lightest: 'slds-badge_lightest',
        success: 'slds-theme_success',
        warning: 'slds-theme_warning',
        error: 'slds-theme_error'
      }.freeze

      def initialize(text: nil, color: :default)
        @text = text
        @color = color
      end

      private

      attr_reader :color, :text

      def css_classes
        [
          'slds-badge',
          COLORS[color]
        ]
      end

      def text_or_content
        text || content
      end
    end
  end
end

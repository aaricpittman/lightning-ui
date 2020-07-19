module Lightning
  module UI
    class IconComponent < ApplicationComponent
      COLORS = {
        current: nil,
        default: 'slds-icon-text-default',
        error: 'slds-icon-text-error',
        light: 'slds-icon-text-light',
        success: 'slds-icon-text-success',
        warning: 'slds-icon-text-warning'
      }.freeze

      SIZES = {
        xx_small: 'slds-icon_xx-small',
        x_small: 'slds-icon_x-small',
        small: 'slds-icon_small',
        default: nil,
        large: 'slds-icon_large'
      }.freeze

      TYPES = %i(
        action
        custom
        doctype
        standard
      ).freeze

      def initialize(color: :default, name:, text: nil, type:, size: :default)
        @color = color
        @name = name
        @text = text
        @type = type
        @size = size
      end

    private

      attr_reader :color, :name, :text, :type, :size

      def container_classes
        [
          'slds-icon_container',
          "slds-icon-#{type}-#{name}"
        ].tap do |css|
          css << 'slds-current-color' if current_color?
        end.join(' ')
      end

      def current_color?
        color == :current
      end

      def svg_classes
        [
          'slds-icon',
          COLORS[color],
          SIZES[size]
        ].compact.join(' ')
      end

      def svg_path
        helpers.asset_path("lightning/ui/icons/#{type}-sprite/svg/symbols.svg")
      end

      def text_or_content
        text || content
      end
    end
  end
end

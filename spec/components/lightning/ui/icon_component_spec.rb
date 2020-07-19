RSpec.describe Lightning::UI::IconComponent, type: :component do
  it 'should require type and name parameters' do
    expect {
      render_inline(described_class.new)
    }.to raise_error(ArgumentError, "missing keywords: name, type")
  end

  it 'should render the container' do
    render_inline(described_class.new(type: :action, name: :add_contact))
    expect(page).to have_selector('span.slds-icon_container.slds-icon-action-add_contact')

    render_inline(described_class.new(type: :standard, name: :action_list_component))
    expect(page).to have_selector('span.slds-icon_container.slds-icon-standard-action_list_component')
  end

  describe 'text' do
    it 'should render the title attribute on the container' do
      render_inline(described_class.new(type: :action, name: :add_contact, text: 'Hello World'))

      expect(page).to have_css('span.slds-icon_container[title="Hello World"]')
    end

    it 'should render the assistive text' do
      render_inline(described_class.new(type: :action, name: :add_contact, text: 'Hello World'))

      expect(page).to have_css('span.slds-assistive-text', text: 'Hello World')
    end
  end

  describe 'color' do
    it 'should render the correct color class on the svg' do
      Lightning::UI::IconComponent::COLORS.keys.reject { |k| k == :current }.each do |key|
        render_inline(described_class.new(type: :action, name: :add_contact, color: key))
        expect(page).to have_selector("svg.slds-icon-text-#{key}")
      end

      render_inline(described_class.new(type: :action, name: :add_contact, color: :current))
      expect(page).not_to have_selector("svg.slds-icon-text-current")
    end

    context 'current color' do
      it 'should render the color class on the container' do
        render_inline(described_class.new(type: :action, name: :add_contact, color: :current))

        expect(page).to have_selector("span.slds-current-color")
      end
    end
  end

  describe 'size' do
    it 'should render the size class on the svg' do
      Lightning::UI::IconComponent::SIZES.reject { |k,v| k == :default }.each do |key, css|
        render_inline(described_class.new(type: :action, name: :add_contact, size: key))

        expect(page).to have_selector("svg.#{css}")
      end

      render_inline(described_class.new(type: :action, name: :add_contact))
      expect(page).not_to have_css('svg.slds-icon[class*="slds-icon_"]')
    end
  end
end

RSpec.describe Lightning::UI::BadgeComponent, type: :component do
  it 'should render text parameter if provided' do
    render_inline(described_class.new(text: 'Hello World!'))

    expect(page).to have_selector('span.slds-badge', text: 'Hello World!')
  end

  it 'should render the blocks contents if provided' do
    render_inline(described_class.new) { 'Hello World!' }

    expect(page).to have_selector('span.slds-badge', text: 'Hello World!')
  end

  it 'should render text parameter if both content block and text parameter are provided' do
    render_inline(described_class.new(text: 'Hello World!')) { 'Goodbye' }

    expect(page).to have_selector('span.slds-badge', text: 'Hello World!')
  end

  it 'should render the base class' do
    render_inline(described_class.new(text: 'Hello World!'))

    expect(page).to have_selector('span.slds-badge', text: 'Hello World!')
  end

  describe 'Color' do
    it 'should not have a color class if :default' do
      render_inline(described_class.new(text: 'Hello World!'))

      Lightning::UI::BadgeComponent::COLORS.values.compact.each do |css_class|
        expect(page).not_to have_css("span.#{css_class}")
      end
    end

    Lightning::UI::BadgeComponent::COLORS.reject { |k, _v| k == :default }.each do |key, css_class|
      it "should render #{css_class} if #{key}" do
        render_inline(described_class.new(color: key))

        expect(page).to have_css("span.#{css_class}")
      end
    end
  end
end

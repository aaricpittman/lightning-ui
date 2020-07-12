Rails.autoloaders.each do |autoloader|
  autoloader.inflector.inflect('ui' => 'UI')
end

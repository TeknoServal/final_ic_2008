require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

Dir.glob(File.join('**', 'lib', '**', '*.rb')).each do |file|
  require './' + file unless /.*crypt.rb/.match?(file)
end

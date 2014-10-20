require 'i18n'
require 'minitest/autorun'
require 'minitest/reporters'
require 'database_cleaner'
require 'active_support'
require 'active_support/test_case'
require 'logger'
require 'pry'

require 'globalize-accessors'
require 'friendly_id'


I18n.available_locales = [:es, :en]
I18n.locale = :es
plugin_test_dir = File.dirname(__FILE__)

ActiveRecord::Base.logger = Logger.new(File.join(plugin_test_dir, "debug.log"))
ActiveRecord::Base.configurations = YAML::load(  IO.read( File.join(plugin_test_dir, 'db', 'database.yml')  ) )
ActiveRecord::Base.establish_connection(:mysql)
ActiveRecord::Migration.verbose = false
load(File.join(plugin_test_dir, "db", "schema.rb"))

Minitest::Reporters.use!
DatabaseCleaner.strategy = :transaction


class MiniTest::Spec

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end

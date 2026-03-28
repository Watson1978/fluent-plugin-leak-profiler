require "helper"
require "fluent/plugin/in_leak_profiler.rb"

class LeakProfilerInputTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Input.new(Fluent::Plugin::LeakProfilerInput).configure(conf)
  end
end

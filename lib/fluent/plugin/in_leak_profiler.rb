require "fluent/plugin/input"
require "leak_profiler"

module Fluent
  module Plugin
    class LeakProfilerInput < Fluent::Plugin::Input
      Fluent::Plugin.register_input("leak_profiler", self)

      config_param :output_dir, :string, default: '/tmp'
      config_param :interval, :time, default: 600

      def start
        super
        LeakProfiler.new(output_dir: @output_dir).report(interval: @interval)
      end
    end
  end
end

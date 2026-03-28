lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = "fluent-plugin-leak-profiler"
  spec.version = "0.0.1"
  spec.authors = ["Watson"]
  spec.email   = ["watson1978@gmail.com"]

  spec.summary       = %q{Fluentd input plugin to profile and investigate memory leaks.}
  spec.description   = %q{This plugin periodically outputs memory allocation profiles by wrapping the leak_profiler gem. It is extremely useful for debugging slow memory leaks and analyzing Ruby heap fragmentation within Fluentd processes.}
  spec.homepage      = "https://github.com/Watson1978/fluent-plugin-leak-profiler"
  spec.license       = "Apache-2.0"

  spec.files         = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[test/ spec/ features/ .git .github])
    end
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "fluentd", [">= 0.14.10", "< 2"]
  spec.add_dependency "leak_profiler"
end

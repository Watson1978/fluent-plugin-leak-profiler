# fluent-plugin-leak-profiler

This plugin periodically outputs memory allocation profiles by wrapping the leak_profiler gem. It is extremely useful for debugging slow memory leaks and analyzing Ruby heap fragmentation within Fluentd processes.

## Installation

### RubyGems

```
$ gem install fluent-plugin-leak-profiler
```

### Bundler

Add following line to your Gemfile:

```ruby
gem "fluent-plugin-leak-profiler"
```

And then execute:

```
$ bundle
```

## Configuration

```
<source>
  @type leak_profiler
  output_dir /tmp
  interval 600
</source>
```

* Parameters
  * output_dir (string) (optional): Directory to output the profile logs. Default is /tmp.
  * interval (time) (optional): Interval to profile and output the memory state. Default is 600 (10 minutes).

## Output Example
The plugin will generate a log file named `leak_profiler-<pid>.log` in the specified `output_dir`.
You can tail this file to monitor memory allocations:

```
$ tail -f /tmp/leak_profiler-12345.log
```

## Copyright

* Copyright(c) 2026- Watson
* License
  * Apache License, Version 2.0

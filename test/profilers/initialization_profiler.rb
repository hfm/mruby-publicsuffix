$LOAD_PATH.unshift File.expand_path("../../lib", __dir__)


report = MemoryProfiler.report do
  PublicSuffix::List.default
end

report.pretty_print
# report.pretty_print(to_file: 'profiler-%s-%d.txt' % [ARGV[0], Time.now.to_i])

$LOAD_PATH.unshift File.expand_path("../../lib", __dir__)


PublicSuffix::List.default

report = MemoryProfiler.report do
  PublicSuffix::List.default.find("a.b.ide.kyoto.jp")
end

report.pretty_print

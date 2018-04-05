PublicSuffix::List.default

report = MemoryProfiler.report do
  PublicSuffix::List.default.find("a.b.ide.kyoto.jp")
end

report.pretty_print

PublicSuffix::List.default

report = MemoryProfiler.report do
  PublicSuffix::List.default.find("www.example.com")
end

report.pretty_print

PublicSuffix::List.default

report = MemoryProfiler.report do
  PublicSuffix.domain("www.example.com")
end

report.pretty_print

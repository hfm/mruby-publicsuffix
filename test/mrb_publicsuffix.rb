##
## PublicSuffix Test
##

assert("PublicSuffix#hello") do
  t = PublicSuffix.new "hello"
  assert_equal("hello", t.hello)
end

assert("PublicSuffix#bye") do
  t = PublicSuffix.new "hello"
  assert_equal("hello bye", t.bye)
end

assert("PublicSuffix.hi") do
  assert_equal("hi!!", PublicSuffix.hi)
end

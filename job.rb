require 'net/http'
require 'uri'
=begin
p Net::HTTP.version_1_2
Net::HTTP.start("https://www.ruby-lang.org/",80){|http|
	response = http.get('/ja/')
	puts response.body
}
//////
Net::HTTP.get_print 'www.ruby-lang.org','/index.html'
Net::HTTP.get_print URI.parse('https://www.ruby-lang.org/ja/')
#url = URI.parse('http://www.example.com/index.html')
#url = URI.parse('https://www.ruby-lang.org/ja/') #httpsはだめ
url = URI.parse('http://news.yahoo.co.jp/pickup/6124544')
req = Net::HTTP::Get.new(url.path)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body
=end

puts Net::HTTP.version_1_1?
puts Net::HTTP.version_1_2?
arr = [1,2,3]
p arr.is_a?(Hash)
p arr.is_a?(Array)

# selt << の定義##########################################
# http://magazine.rubyist.net/?0046-SingletonClassForBeginners
# defiune peculiar method to object -> define one's own method direcotry
hello = 'hello'
def hello.say(count=1)
	count.times{print self}
end
hello.say 2

# bad exmaple
another_hello = "hello"
#another_hello.say 3

# class << object => pull peculiar class of object and defiune peculiar method to object
# definition of a peculiar obeject!
class << hello
	def say_world
		puts "#{self}, world!"
	end
end
hello.say_world

class Foo
	class << self



########################################












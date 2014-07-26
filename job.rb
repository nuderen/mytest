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

puts HTTPVersion

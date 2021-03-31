require 'uri'

def domain_name(url)
  arr = URI.parse(url).host.split(".")
  arr.first == "www" ? arr[1] : arr[0]
end

p domain_name("http://github.com/carbonfive/raygun")
p domain_name("http://www.zombie-bites.com")
p domain_name("https://www.cnet.com")
p domain_name("http://github.com/carbonfive/raygun")
p domain_name("http://www.zombie-bites.com")
p domain_name("https://www.cnet.com")
p domain_name("http://google.com")
p domain_name("http://google.co.jp")
p domain_name("www.xakep.ru")
p domain_name("https://youtube.com")

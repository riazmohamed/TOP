# Complete the function/method so that it returns the url with anything after the anchor (#) removed.
#
# # returns 'www.codewars.com'
# remove_url_anchor('www.codewars.com#about')
#
# # returns 'www.codewars.com?page=1'
# remove_url_anchor('www.codewars.com?page=1')

def remove_url_anchor(url)
  url.gsub(/(\S+)#(\S+)?/) { $1 }
end

p remove_url_anchor('www.codewars.com#about')
p remove_url_anchor('www.codewars.com?page=1')

puts "\t\v============ OPTION2 ============"
# OPTION2

def remove_url_anchor1(url)
  url.split('#')[0]
end
p remove_url_anchor1('www.codewars.com#about')
p remove_url_anchor1('www.codewars.com?page=1')

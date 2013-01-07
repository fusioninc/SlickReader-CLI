require 'rubygems'
require 'nokogiri'
require 'open-uri'


def clean(string)
	return string.delete("\n").split.join(" ")
end

while true 
	contents = Nokogiri::HTML(open('http://slickdeals.net'))

	contents.css('span.dealblocktext h3').each do | method_span |
		deal_string = clean(method_span.text)
		if deal_string.length > 0
			puts "Deal: #{deal_string}" unless deal_string.include? "Expired"	
		end
	end
	sleep(5)
end
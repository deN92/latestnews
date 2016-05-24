class StatsController < ApplicationController
	def exchange
		xml = Nokogiri::XML(open("bank-ua.xml"))
		@xml = xml.xpath('//item')

		xm = Nokogiri::XML(open("exchange_history.xml"))
		@xm = xm.xpath('//item')
		begin
			@data_from = Date.parse(params[:data_from])
			@data_to = Date.parse(params[:data_to])
		rescue
			@data_from = 1.month.ago
			@data_to = DateTime.now.to_date 
		end

		@stats_exchange_usd = {}
		@xm.each do |valute|
			data = Date.parse(valute.at('date').text)
			if (@data_from <= data &&  data <= @data_to)
				@stats_exchange_usd.merge!({data => valute.at('rate').text})
			end
		end

		exc_date = String.new
		bank_date = String.new
		bank_date_xml = String.new
		bank_char3_xml = String.new
		bank_rate_xml = String.new

		bank = Nokogiri::XML(open("bank-ua.xml"))
		bank = bank.xpath('//item[char3="USD"]')
		bank.each do |i|
			bank_date = Date.parse(i.at('date').text)
			bank_date_xml = "<date>#{bank_date}</date>"
			bank_char3_xml = "<char3>#{i.at('char3').text}</char3>"
			bank_rate_xml = "<rate>#{i.at('rate').text.to_f/i.at('size').text.to_f}</rate>"
		end
		exc = Nokogiri::XML(open("exchange_history.xml"))
		exc = exc.xpath('//item[last()]')
		exc.each do |i|
			exc_date = Date.parse(i.at('date').text)
		end

		exc_today =  "  <item>\n    #{bank_date_xml}\n    #{bank_char3_xml}\n    #{bank_rate_xml}\n  </item>\n"
		unless (bank_date == exc_date)
			xmq = Nokogiri::XML(open("exchange_history.xml"))
			doc = Nokogiri::XML(xmq.to_xml)
			doc.at('chapter') << exc_today
			File.open("exchange_history.xml","w") do |f|
				f.puts("#{doc}")
			end
		end
	end
end

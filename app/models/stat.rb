class Stat

	def exchange
		select_eur_usd("\"USD\"", "exchange_history.xml")
		select_eur_usd("\"EUR\"", "exchange_history_euro.xml")
	end

	def select_eur_usd(char3, file)
		exc_date, bank_date, bank_date_xml, bank_char3_xml, bank_rate_xml = String.new
		bank = Nokogiri::XML(open("bank-ua.xml"))
		bank = bank.xpath('//item[char3='+char3+']')
		bank.each do |i|
			bank_date = Date.parse(i.at('date').text)
			bank_date_xml = "<date>#{bank_date}</date>"
			bank_char3_xml = "<char3>#{i.at('char3').text}</char3>"
			bank_rate_xml = "<rate>#{i.at('rate').text.to_f/i.at('size').text.to_f}</rate>"
		end
		exc = Nokogiri::XML(open(file))
		exc = exc.xpath('//item[last()]')
		exc.each do |i|
			exc_date = Date.parse(i.at('date').text)
		end

		exc_today =  "  <item>\n    #{bank_date_xml}\n    #{bank_char3_xml}\n    #{bank_rate_xml}\n  </item>\n"
		unless (bank_date == exc_date)
			xmq = Nokogiri::XML(open(file))
			doc = Nokogiri::XML(xmq.to_xml)
			doc.at('chapter') << exc_today
			File.open(file,"w") do |f|
				f.puts("#{doc}")
			end
		end
	end
end
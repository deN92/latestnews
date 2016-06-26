class StatsController < ApplicationController

	def exchange
		@xml = Nokogiri::XML(open("bank-ua.xml"))
		@xml = @xml.xpath('//item')
		@stats_exchange_usd = Hash.new
		@stats_exchange_eur = Hash.new
		select_eur_usd("exchange_history.xml", @stats_exchange_usd)
		select_eur_usd("exchange_history_euro.xml", @stats_exchange_eur)
		stat = Stat.new
		stat.exchange
	end

	def select_eur_usd(file, stats_exchange_curr)
		xml_history_rates = Nokogiri::XML(open(file))
		xml_history_rates = xml_history_rates.xpath('//item')
		begin
			@data_from = Date.parse(params[:data_from])
			@data_to = Date.parse(params[:data_to])
		rescue
			@data_from = 1.month.ago
			weekend = DateTime.now.strftime("%a")
			@data_to = 1.days.from_now.to_date
			@data_to = 3.days.from_now.to_date if weekend == "Fri"
			@data_to = 2.days.from_now.to_date if weekend == "Sat"
		end
		xml_history_rates.each do |valute|
			data = Date.parse(valute.at('date').text)
			if (@data_from <= data &&  data <= @data_to)
				stats_exchange_curr.merge!({data => valute.at('rate').text.to_f.round(2)})
			end
		end
	end
end

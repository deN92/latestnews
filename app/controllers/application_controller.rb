class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	require 'open-uri'
	require 'nokogiri'

	def valcurs
		begin
			xml_content = Nokogiri::HTML(open("http://bank-ua.com/export/currrate.xml"))
			File.open("bank-ua.xml","w") do |f|
				f.puts("#{xml_content}")
			end
		rescue
		end
		xml = Nokogiri::XML(open("bank-ua.xml"))
		xml = xml.xpath('//item[code=840]', '//item[code=978]','//item[code=643]', '//item[code=985]')
		return xml
	end

	def render_404
		render file: "public/404.html", status: 404
	end

	def check_if_admin
		render_403 unless user_signed_in? and current_user.is_admin
	end

end

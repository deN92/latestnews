module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

	def url_to_img(s)
		s.gsub! /\s(http:\/\/.*?\.(png|jpg))\s/,
						'img scr="\1"'
		s.html_safe
	end
end

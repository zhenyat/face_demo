class PagesController < ApplicationController
  def home
    puts "ZT!   #{Rails.application.credentials.config[:domain]}"
    puts "ZT!   #{Rails.application.credentials.config[:api_key]}"
    puts "ZT!   #{Rails.application.credentials.config[:api_secret]}"

    @domain = Face.get_domain
    @key    = Face.get_key
    # @secret = Face.get_secret

    asterisks =''
    for i in (0..59)
      asterisks[i]= '*'
    end
    @secret = "#{asterisks} #{Face.get_secret.last(4)}"
  end
end

class DemoController < ApplicationController
  def index
    @message = Face::Demo.get_message

    @domain = Face.get_domain
    @key    = Face.get_key

    asterisks =''
    for i in (0..59)
      asterisks[i]= '*'
    end
    @secret = "#{asterisks} #{Face.get_secret.last(4)}"
  end
end

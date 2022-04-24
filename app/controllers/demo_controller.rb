class DemoController < ApplicationController
  def index
    @message = Face::Demo.get_message
  end
end

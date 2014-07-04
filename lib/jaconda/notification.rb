module Jaconda
  class Notification < ActiveResource::Base
    self.prefix = "/api/v2/rooms/:room_id"
    self.element_name = ""

    def self.authenticate(options)
      self.site = "https://#{options[:subdomain]}.jaconda.im"
      @room_id = options[:room_id]
      self.user = options[:room_token]
      self.password = "x"
    end

    def self.notify(params = {})
      options = {:room_id => @room_id}
      headers = {"Content-Type"=>"application/x-www-form-urlencoded"}
      body = CGI.unescape({message: params}.to_query)
      connection.post(custom_method_collection_url(:notify, options), body, headers)
    end
  end
end

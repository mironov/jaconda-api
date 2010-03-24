require 'active_resource'

module Jaconda
  class API < ActiveResource::Base
    self.site = "http://jaconda.im"
    self.prefix = "/api/"
    
    def self.authenticate(api_token)
      self.password = 'x'
      self.user = api_token
    end
  end

  class Room < API
    def users(options = {})
      User.find(:all, :params => options.update(:room_id => id))
    end

    def messages(options = {})
      Message.find(:all, :params => options.update(:room_id => id))
    end
  end

  class User < API
    self.prefix = "/api/rooms/:room_id/"
  end

  class Message < API
    self.prefix = "/api/rooms/:room_id/"
  end
end
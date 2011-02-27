module Jaconda
  class API < ActiveResource::Base
    self.prefix = "/api/v2/"

    def self.authenticate(options)
      self.site = "https://#{options[:subdomain]}.jaconda.im"
      if options[:token]
        self.user = options[:token]
        self.password = "x"
      else
        self.user = options[:email]
        self.password = options[:password]
      end
    end
  end
end
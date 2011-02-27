module Jaconda
  class API::Message < API
    self.prefix = "/api/v2/rooms/:room_id/"

    def self.search(options = {})
      get(:search, options)
    end

    def self.transcript(options = {})
      date = options[:date] || Date.today
      get("#{date.year}/#{date.month}/#{date.day}", options)
    end
  end
end
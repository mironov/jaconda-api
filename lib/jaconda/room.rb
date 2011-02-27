module Jaconda
  class API::Room < API
    def id
      jid
    end

    def presences
      API::Presence.prefix = "/api/v2/rooms/:room_id/"
      API::Presence.find(:all, :params => {:room_id => id})
    end

    def uploads
      API::Upload.prefix = "/api/v2/rooms/:room_id/"
      API::Upload.find(:all, :params => {:room_id => id})
    end

    def messages(options = {})
      API::Message.find(:all, :params => options.update(:room_id => id))
    end

    def search(options = {})
      API::Message.search(options.update(:room_id => id))
    end

    def transcript(options = {})
      API::Message.transcript(options.update(:room_id => id))
    end
  end
end
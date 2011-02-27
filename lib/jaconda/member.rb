module Jaconda
  class API::Member < API
    self.element_name = "user"

    def self.collection_name
      "members"
    end

    def presences
      API::Presence.prefix = "/api/v2/members/:user_id/"
      API::Presence.find(:all, :params => {:user_id => id})
    end

    def uploads
      API::Upload.prefix = "/api/v2/members/:user_id/"
      API::Upload.find(:all, :params => {:user_id => id})
    end
  end
end
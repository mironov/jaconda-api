Jaconda API
--------------

The official ruby wrapper for working with the [Jaconda REST API](http://help.jaconda.im/faqs/api/jaconda-api-documentation)'s XML interface.  

== Installation

 gem install jaconda-api

== Requirements

ActiveResource


== Usage

The first thing you need to set the authentication.

 Jaconda::API.authenticate("API_TOKEN")

=== Finding rooms

 Jaconda::Room.find(:all) # find all rooms for the current account.
 Jaconda::Room.find(123)   # find individual room by ID

=== Creating a Room

 room = Jaconda::Room.new(:jid => 'awesome.project')
 room.title = "Awesome Project Room"
 room.save

=== Updating a Room

 room = Jaconda::Room.find(123)
 room.status_message = "Deadline: 3 apr"
 room.save

=== Finding messages

 room = Jaconda::Room.find(123)
 room.messages

 Jaconda::Message.find(:all, :params => { :room_id => 123 })
 Jaconda::Message.find(:all, :params => { :room_id => 123, :per_page => 100, :page => 2 })

=== Creating a Message

 Jaconda::Message.create(:room_id => 123, :text => "Hello from the API!")

=== Finding users

 room = Jaconda::Room.find(123)
 room.users

 Jaconda::User.find(:all, :params => { :room_id => 123 })

=== Creating a User

 Jaconda::User.create(:room_id => 123, :jid => "developer@gmail.com")

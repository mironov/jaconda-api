Jaconda API
--------------

The official ruby wrapper for working with the [Jaconda REST API](http://help.jaconda.im/kb/api-v2/jaconda-api-documentation)'s XML interface.

## Installation

 gem install jaconda

## Requirements

ActiveResource

## Usage

### Sending notifications

    Jaconda::Notification.authenticate(:subdomain => "JACONDA_SUBDOMAIN",
                                       :room_id => "ROOM_ID",
                                       :room_token => "ROOM_TOKEN")

    Jaconda::Notification.notify(:text => "146 tests, 1399 assertions, 0 failures, 0 errors",
                                 :sender_name => "Build Server")

### Using API

    Jaconda::API.authenticate(:subdomain => "JACONDA_SUBDOMAIN",
                              :token => "API_TOKEN")

    Jaconda::API.authenticate(:subdomain => "JACONDA_SUBDOMAIN",
                              :email => "EMAIL",
                              :password => "PASSWORD")

#### Finding rooms

    Jaconda::API::Room.find(:all)
    Jaconda::API::Room.find("support")

#### Finding who's available in the room

    room = Jaconda::API::Room.find("support")
    room.available_users

#### Finding who has access to the room

    room = Jaconda::API::Room.find("support")
    room.presences

#### Creating a Room

    Jaconda::API::Room.create(:jid => "awesome.project",
                              :title => "Awesome Project Room")

#### Updating a Room

    room = Jaconda::API::Room.find("support")
    room.topic = "Deadline: 3 apr"
    room.save

#### Finding messages

    room = Jaconda::API::Room.find("support")
    room.messages
    room.messages(:page => 2)

    Jaconda::API::Message.find(:all, :params => { :room_id => "support",
                                                  :per_page => 100,
                                                  :page => 2 })

#### Finding messages on date

    room = Jaconda::API::Room.find("support")
    room.transcript
    room.transcript(:date => Date.yesterday)

    Jaconda::API::Message.transcript(:room_id => "support",
                                     :date => Date.today - 1.month)

#### Searching for messages

    room = Jaconda::API::Room.find("support")
    room.search(:text => "bug")
    room.search(:text => "commit", :per_page => 5)

    Jaconda::API::Message.search(:room_id => "support",
                                 :text => "issue",
                                 :page => 2)

#### Saying something

    Jaconda::API::Message.create(:room_id => "support",
                                 :text => "Hello from the API!")

    Jaconda::API::Message.create(:room_id => "support",
                                 :text => "is loving Jaconda!",
                                 :kind => "me")

    Jaconda::API::Message.create(:room_id => "support",
                                 :text => "Hello from the API!",
                                 :kind => "voice")

#### Finding members

    Jaconda::API::Member.find(:all)
    Jaconda::API::Member.find(123)

#### Inviting new member

    Jaconda::API::Member.create(:name => "Anton",
                                :email => "developer@gmail.com")

#### Finding uploads

    room = Jaconda::API::Room.find("support")
    room.uploads

    member = Jaconda::API::Member.find(123)
    member.uploads
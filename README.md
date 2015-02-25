# Speedio

[![wercker status](https://app.wercker.com/status/72076931d2d2582cb730b64b721e9405/s/master "wercker status")](https://app.wercker.com/project/bykey/72076931d2d2582cb730b64b721e9405)

Ruby library for [Speedio API](http://www.speedio.com.br)

## Installation

Add this line to your application's Gemfile:

    gem 'speedio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install speedio

## Config

    Speedio.configure do |config|
      config.base_url # Server url, default: ENV['SPEEDIO_BASE_URL']
      config.token    # Auth token, default: ENV['SPEEDIO_TOKEN']
    end

## Usage

### Sending a message

    message = Speedio::Message.new '5511987654321', 'Text message'
    message.send

### Reading messages

To read messages you have to pass the phone number and the last timestamp.

    Speedio::Receiver.new('5511987654321', '123456').all

Will return an object that contains messages, messages_count, last_message_timestamp and contact_info

## AZK

You can use [azk](http://azk.io) to build and test this project.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/speedio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

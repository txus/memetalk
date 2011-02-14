require 'yaml'
require 'talker/client'
require 'meme'
require 'eventmachine'

module Memetalk

  class << self

    def list
      Meme::GENERATORS.keys
    end

    def run argv = ARGV
      publish Meme.run(argv) + '.jpg'
    end

    def publish link
      EM.run do
        Talker::Client.connect(:room => room, :token => token) do |client|
          client.on_connected do
            client.send_message link
            client.close
          end
          client.on_close do
            EM.stop
          end
          client.on_error do |error|
            $stdout.print error
          end
        end
      end
    end

    private

    def token
      @@token ||= YAML.load(File.read(File.join(File.expand_path('~'), '.memetalkrc')))["talker"]["token"]
    end
    def room
      @@room ||= YAML.load(File.read(File.join(File.expand_path('~'), '.memetalkrc')))["talker"]["room"]
    end
  end
end

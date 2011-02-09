require 'spec_helper'
require 'eventmachine'
require 'meme'


describe Memetalk do
  describe '.list' do
    it 'returns the available meme list' do
      Meme::GENERATORS.stub(:keys).and_return ['Y_U_NO', 'PHILOSORAPTOR']
      Memetalk.list.should == ['Y_U_NO', 'PHILOSORAPTOR']
    end
  end
  describe '.run' do
    it 'delegates meme creation to Meme Generator and publishes it' do
      link = 'http://google.com'
      Meme.should_receive(:run).with(['Y_U_NO', 'TEST', 'WHY U NO GREEN']).and_return link
      Memetalk.should_receive(:publish).with (link + '.jpg')
      Memetalk.run(['Y_U_NO', 'TEST', 'WHY U NO GREEN'])
    end
  end
  describe '.publish' do
    it 'publishes a link to talker' do
      room = double :room
      token = double :token
      client = double :client
      error = double :error
      link = double :link

      EM.should_receive(:run).and_yield

      Memetalk.stub(:token).and_return token
      Memetalk.stub(:room).and_return room
      Talker::Client.should_receive(:connect).with(room: room, token: token).and_yield client

      # on connected callback
      client.should_receive(:on_connected).and_yield
      client.should_receive(:send_message).with link
      client.should_receive(:close)

      # on close callback
      client.should_receive(:on_close).and_yield
      EM.should_receive(:stop)

      # on error callback
      client.should_receive(:on_error).and_yield error
      $stdout.should_receive(:print).with error

      Memetalk.publish link
    end
  end
  describe '.token' do
    it 'returns the token from ~/.memetalkrc' do
      File.should_receive(:read).and_return """
      talker:
        token: 'a1e23f4567'
      """
      Memetalk.send(:token).should == 'a1e23f4567'
    end
  end

  describe '.room' do
    it 'returns the room from ~/.memetalkrc' do
      File.should_receive(:read).and_return """
      talker:
        room: 1398
      """
      Memetalk.send(:room).should == 1398
    end
  end

end

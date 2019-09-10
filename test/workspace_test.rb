require_relative 'test_helper'

describe Workspace do
  before do
    VCR.use_cassette('workspace') do
      @workspace = Workspace.new
    end
  end
  
  describe 'Constructor' do
    it 'can create a Workspace instance' do
      expect(@workspace).must_be_instance_of Workspace
    end

    it 'has users, channels and selected' do
      expect(@workspace.channels).must_be_instance_of Array
      expect(@workspace.users).must_be_instance_of Array
      assert_nil(@workspace.selected)
    end

    it 'populates users and channels' do
      expect(@workspace.channels.first).must_be_instance_of Channel
      expect(@workspace.users.first).must_be_instance_of User
    end
  end

  describe '#select_channel' do
    
  end
  
  describe '#select_user' do
    
  end

  describe '#send_message' do
    
  end
end

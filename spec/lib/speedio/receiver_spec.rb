require 'spec_helper'

describe Speedio::Receiver do
  let(:request_mock) { double messages: true }

  subject { described_class.new :number }

  before do
    Speedio::Request.stub(:new).and_return request_mock
  end

  describe "#all" do
    it "should call request with correct parameters" do
      request_mock.should_receive(:messages).with({
        from: :number, timestamp: '1'
      })

      subject.all
    end

    context "when there is a timestamp" do
      subject { described_class.new :number, '1234' }

      it "should call request with correct parameters" do
        request_mock.should_receive(:messages).with({
          from: :number, timestamp: '1234'
        })

        subject.all
      end
    end
  end
end

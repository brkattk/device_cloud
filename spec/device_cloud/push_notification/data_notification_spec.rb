require 'spec_helper'

describe DeviceCloud::PushNotification::DataNotification do
  describe "#handle!" do
    let(:data) do
      {
        'id' => 1234,
        'device_id' => 'm:1392301029',
        'type' => 'some type',
        'queued_dt' => '2013-06-24T14:52:55.421Z',
        'value' => {'this' => 'is a value'}
      }
    end
    let(:file_data) { OpenStruct.new(data: data, full_path: '/foo/bar/baz.json') }

    subject { DeviceCloud::PushNotification::DataNotification.new file_data }

    it "should call the DeviceCloud.data_notification_handler with self" do
      handled_data = nil
      DeviceCloud.data_notification_handler = ->(data) { handled_data = data }

      subject.handle!
      expect(handled_data).to eq subject
    end
  end
end
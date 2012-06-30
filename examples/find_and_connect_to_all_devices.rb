require_relative "../ruby_bluetooth"
require 'active_support/secure_random'

#sock = Bluetooth::L2CAPSocket.new

#uuid = SecureRandom.uuid
#name = 'some name'
#desc = 'some desc'
#prov = 'some provider'
#service = Bluetooth::Service.new uuid, name, desc, prov
#sock.bind 4445
#reg = service.register sock


#returns an array of devices found
#Devices have an addr and name
a = Bluetooth::Devices.scan

p "Found #{a.length} bluetooth devices"

threads = []
a.each do |device|
  p "connecting to #{device.name} (#{device.addr}) on port 1 (RFCOMM)"

  #L2CAP is like UDP, RFCOMM is like TCP
  sock = Bluetooth::RFCOMMSocket.new

  threads << Thread.new do
    begin
      sock.connect(device.addr, 1) 
    rescue Exception => ex
      p ex.message
    end
  end
end

threads.each do |thread|
  thread.join
end

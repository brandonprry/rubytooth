require_relative "ruby_bluetooth"
require 'active_support/secure_random'

sock = Bluetooth::L2CAPSocket.new

uuid = SecureRandom.uuid
name = 'some name'
desc = 'some desc'
prov = 'some provider'
service = Bluetooth::Service.new uuid, name, desc, prov

sock.bind 4445

reg = service.register sock

p reg.inspect
p service.inspect
gets

#boo = sock.connect('CC:52:AF:7D:A5:BE', 1234)

gets

a = Bluetooth::Devices.scan
a.each { |device|
  puts device.addr
  puts device.name
  p device
}
p a

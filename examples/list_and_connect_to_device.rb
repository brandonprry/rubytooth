require_relative "../ruby_bluetooth"

devices = Bluetooth::Devices.scan

i = 1
devices.each do |device|
  p "#{i}. #{device.name} (#{device.addr})"
end

device_index = gets.to_i - 1

device = devices[device_index]

p device.name

sock = Bluetooth::RFCOMMSocket.new
sock.connect(device.addr, 1)
sock.send("hello")

sock.close()

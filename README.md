rubytooth
=========
<pre>
Updated ruby bluetooth bindings based on ruby-bluetooth
(https://rubyforge.org/projects/ruby-bluetooth/)

The above link will only run/compile with ruby 1.8.7. The source hasn't
been touched since mid-2006.

I have currently updated bluetooth_linux to run on 1.9.3. I updated the
headers in macosx and win32 but have not even tried to compile them
since I have neither a mac nor a win32 dev env.
</pre>

Example:
===========

<pre>
bperry@bperry-rapid7:~/work/rubytooth$ ruby extconf.rb && make && cat
sample_program.rb && ruby sample_program.rb 
checking for main() in -lbluetooth... yes
creating Makefile
linking shared-object ruby_bluetooth.so


    require_relative "ruby_bluetooth"

    a = Bluetooth::Devices.scan
    a.each { |device|
      puts device.addr
      puts device.name
      p device
    }
    p a


F0:1C:13:55:0B:E7
LG-C800
#&lt;Bluetooth::Device:0x00000001d123c8&gt;
[#&lt;Bluetooth::Device:0x00000001d123c8&gt;]
bperry@bperry-rapid7:~/work/rubytooth$ 
</pre>

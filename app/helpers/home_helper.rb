require 'socket'

module HomeHelper

  def local_ip
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily

    UDPSocket.open do |s|
      s.connect '192.168.99.100', 1
      s.addr.last
    end
  ensure
    Socket.do_not_reverse_lookup = orig
  end

end

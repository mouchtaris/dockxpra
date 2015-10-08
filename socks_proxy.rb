require 'shellwords'

def empty?(str)
  str.nil? || str.empty?
end

def es(str)
  Shellwords.escape(str)
end

raise 'ARGV[0]: local port'   if empty? ARGV[0]
raise 'ARGV[1]: remote port'  if empty? ARGV[1]
raise 'ARGV[2]: container'    if empty? ARGV[2]
lport = ARGV.shift.to_i
rport = ARGV.shift.to_i
container = ARGV.shift

def container_ip_command(container)
  %Q{docker inspect -f '{{.NetworkSettings.IPAddress}}' #{container}}
end

hagrid_command = %Q{ssh -D #{rport} -N "$(#{container_ip_command(container)})"}
local_command = %Q{ssh -A -L #{lport}:localhost:#{rport} "$(resolv:hagrid)" bash -c #{es es hagrid_command}}
puts local_command

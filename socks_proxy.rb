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

hagrid_internal_ip_command =
  %Q{echo 0.0.0.0}
  # %Q{gcloud compute instances list --format=yaml -r hagrid | ruby -r yaml -e 'puts YAML.load(STDIN.read)["networkInterfaces"].first["networkIP"]'}
hagrid_command = %Q{export PATH=$HOME/tmp/dockintelli:"$PATH"; which _ssh_enable; _ssh_enable #{container}; _ssh_nocheck -A -N -D "$(#{hagrid_internal_ip_command})":#{rport} "$(#{container_ip_command(container)})"}
local_command = %Q{_ssh_enable #{container}; ssh -A -L #{lport}:localhost:#{rport} "$(resolv:hagrid)" bash -x -c #{es es hagrid_command}}
puts local_command

require "socket"

external_ip  = UDPSocket.open {|s| s.connect("8.8.8.8", 1); s.addr.last}

iface = Mixlib::ShellOut.new("ip a | awk '/#{external_ip}/ { print $7 }'")
iface.run_command
iface.error!
external_iface = iface.stdout[0..-2]

vg = Mixlib::ShellOut.new("vgs --sort -size --rows | grep VG -m 1 | awk '{print $2}'")
vg.run_command
vg.error!
largest_vg  = vg.stdout[0..-2]


default[:creds][:admin_password]  = "mySuperSecret"
default[:creds][:mysql_password]  = "r00tSqlPass"
default[:creds][:keystone_token]  = "c6c5de883bfd0ef30a71"
default[:creds][:swift_hash]      = "12c51e21fc2824fff5c5"
default[:creds][:neutron_secret]  = "c6c5de883bfd0ef30a71"
default[:creds][:ssh_keypair]     = "openstack"
default[:creds][:esxi_password]   = "mySuperSecret"

default[:ip][:controller]   = node[:ipaddress]
default[:ip][:qpid]         = node[:ip][:controller]
default[:ip][:keystone]     = node[:ip][:controller]
default[:ip][:swift]        = node[:ip][:controller]
default[:ip][:glance]       = node[:ip][:controller]
default[:ip][:cinder]       = node[:ip][:controller]
default[:ip][:neutron]      = node[:ip][:controller]
default[:ip][:nova]         = node[:ip][:controller]
default[:ip][:heat]         = node[:ip][:controller]
default[:ip][:ceilometer]   = node[:ip][:controller]
default[:ip][:esxi]         = "192.168.250.100"

default[:auto][:volume_group] = largest_vg
default[:auto][:external_ip] = external_ip
default[:auto][:external_nic] = external_iface
default[:auto][:gateway] = node[:network][:default_gateway]
default[:auto][:netmask] = node[:network][:interfaces][external_iface]\
                               [:addresses][external_ip][:netmask]





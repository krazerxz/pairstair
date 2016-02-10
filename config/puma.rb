workers 1
daemonize
pidfile File.expand_path "../tmp/pids/puma.pid", __dir__
state_path File.expand_path "../tmp/puma.state", __dir__
bind "unix://#{File.expand_path '../tmp/puma.sock', __dir__}"

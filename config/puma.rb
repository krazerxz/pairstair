workers 1
daemonize
pidfile File.expand_path "/home/pairstair/pairstair/current/tmp/pids/puma.pid", __dir__
state_path File.expand_path "/home/pairstair/pairstair/current/tmp/puma.state", __dir__
bind "unix:///home/pairstair/pairstair/current/tmp/puma.sock"
stdout_redirect "/home/pairstair/pairstair/current/log/pumout.log", "/home/pairstair/pairstair/current/log/pumerr.log", true

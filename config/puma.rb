workers 1
daemonize
#pidfile File.expand_path "../tmp/pids/puma.pid", __dir__
#state_path File.expand_path "../tmp/puma.state", __dir__
#bind "unix://#{File.expand_path '../tmp/puma.sock', __dir__}"
#stdout_redirect 'log/pumout.log', 'log/pumerr.log', true
pidfile File.expand_path "/home/pairstair/pairstair/current/tmp/pids/puma.pid", __dir__
state_path File.expand_path "/home/pairstair/pairstair/current/tmp/puma.state", __dir__
bind "unix://#{File.expand_path '/home/pairstair/pairstair/current/tmp/puma.sock', __dir__}"
stdout_redirect '/home/pairstair/pairstair/current/log/pumout.log', '/home/pairstair/pairstair/current/log/pumerr.log', true

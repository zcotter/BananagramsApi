worker_processes Integer(ENV['WEB_CONCURRENCY'] || 1)
timeout 30
preload_app true
working_directory "/home/zcotter/BananagramsApi"
pid "/home/zcotter/BananagramsApi/pids/unicorn.pid"
stderr_path "/home/zcotter/BananagramsApi/log/unicorn.log"
stdout_path "/home/zcotter/BananagramsApi/log/unicorn.log"
listen "/tmp/unicorn.BananagramsApi.sock"

before_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) &&
  ActiveRecord::Base.connection.disconnect!
end

after_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) &&
  ActiveRecord::Base.establish_connection
end

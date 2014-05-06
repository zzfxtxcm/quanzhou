worker_processes 2
timeout 30

APP_PATH = File.expand_path("../..", __FILE__)
working_directory APP_PATH

listen "/tmp/unicorn.sock", :backlog => 64
listen 5000, :tcp_nopush => false

stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stdout.log"

pid APP_PATH + "/tmp/pids/unicorn.pid"

# To save some memory and improve performance
preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

# Force the bundler gemfile environment variable to
# reference the Сapistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(app_root, 'Gemfile')
end

before_fork do |server, worker|
  # 参考 http://unicorn.bogomips.org/SIGNALS.html
  # 使用USR2信号，以及在进程完成后用QUIT信号来实现无缝重启
  # old_pid = shared_root + '/tmp/pids/unicorn.pid.oldbin'
  # if File.exists?(old_pid) && server.pid != old_pid
  #   begin
  #     Process.kill("QUIT", File.read(old_pid).to_i)
  #   rescue Errno::ENOENT, Errno::ESRCH
  #     # someone else did our job for us
  #   end
  # end

  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  # 禁止GC，配合后续的OOB，来减少请求的执行时间
  GC.disable
  # the following is *required* for Rails + "preload_app true",
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

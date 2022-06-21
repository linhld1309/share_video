lock "~> 3.17.0"
server '34.125.204.123', port: 22, roles: [:web, :app, :db], primary: true

set :user, 'deploy'

set :application, "share_video"
set :repo_url, "git@github.com:linhld1309/share_video.git"
set :branch, "master"
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
# append :linked_files, "config/master.key"

# set :pty, true
# linked_file = Proc.new {|word| !File.exist?(word) && (set :linked_files, fetch(:linked_files, []).push(word))}
# linked_dir = Proc.new {|word| !File.exist?(word) && (set :linked_dirs, fetch(:linked_dirs, []).push(word))}

# %w{config/database.yml config/database.yml config/secrets.yml}.each(&linked_file)
# %w{log tmp/pids tmp/cache tmp/sockets public/uploads}.each(&linked_file)

set :keep_releases, 5
set :rbenv_path, '/home/deploy/.rbenv/'
set :rbenv_ruby, '2.7.5'

set :puma_rackup, -> {File.join(current_path, "config.ru")}
set :puma_state, -> {"#{shared_path}/tmp/pids/puma.state"}
set :puma_pid, -> {"#{shared_path}/tmp/pids/puma.pid"}
set :puma_bind, -> {"unix://#{shared_path}/tmp/sockets/puma.sock"}
set :puma_conf, -> {"#{shared_path}/puma.rb"}
set :puma_access_log, -> {"#{shared_path}/log/puma_access.log"}
set :puma_error_log, -> {"#{shared_path}/log/puma_error.log"}
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, "production"))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "buildesk"
set :repo_url, "git@github.com:en-Barry/buildesk.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/app/buildesk"

set :branch, ENV['BRANCH'] || "main"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/credentials/production.key"

# sharedディレクトリに入れるファイルを指定
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# 保存しておく世代の設定
set :keep_releases, 5

# ssh接続設定
# set :ssh_options, verify_host_key: :secure

# rbenvの設定
set :rbenv_type, :system
set :rbenv_ruby, '2.6.6'
set :rbenv_path, '/usr/local/rbenv'

# pumaの設定
set :puma_conf, "#{current_path}/config/puma/production.rb"

namespace :deploy do
  # pumaの再起動
  task :puma_restart_again do
    invoke  'puma:stop'
    invoke! 'puma:start'
  end
end
after 'puma:restart', 'deploy:puma_restart_again'

  # before :starting, :init_permission
  # after :finished, :reset_permission
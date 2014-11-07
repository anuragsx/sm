set :application, "SwapMyWhip"
set :repository,  "git@smw.unfuddle.com:smw/smw.git"
set :branch, "master"
ssh_options[:port] = 2222
ssh_options[:keys] = "/home/mthomas/.ssh/id_rsa"
ssh_options[:paranoid] = false
default_run_options[:pty] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_username, "hest21"
set :scm_passphrase, "Sw@pMyWh1p"

set :deploy_via, :remote_cache
set :deploy_to, "/var/www/swapmywhip"

role :web, "swapmywhip.com"                          # Your HTTP server, Apache/etc
role :app, "swapmywhip.com"                          # This may be the same as your `Web` server
role :db,  "swapmywhip.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

#Copy images to shared directory outside of code base
desc "Creates symlinks from shared_path to upload directories for uploaded images"
	task :symlink_upload_directories , :roles => :app do
		[
			'public/images/uploaded'
		].each do |upload_path|
			run "mkdir -p #{shared_path}/files/#{upload_path}"
			run "rm -rf #{current_path}/#{upload_path} && ln -nfs #{shared_path}/files/#{upload_path} #{current_path}/#{upload_path}"
		end
	end

#desc "Chown entire release directory to www-data"
#	task :chown_wwwdata , :roles => :app do
#		run sudo "chown -R www-data:www-data #{release_path}/*"
#	end
	
#This line calls the above task after the deploy:symlink default Cap task
after "deploy:symlink", :symlink_upload_directories
#after "deploy:symlink", :chown_wwwdata

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :mod_rails do
  desc <<-DESC
  Restart the application altering tmp/restart.txt for mod_rails.
  DESC
  task :restart, :roles => :app do
    run "touch  #{release_path}/tmp/restart.txt"
  end
end

namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
end

#namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

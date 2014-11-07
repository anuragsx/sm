# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))
=begin
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'


require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'tasks/rails'
=end

require File.expand_path('../config/application', __FILE__)
require 'rake'

SmwSmw::Application.load_tasks
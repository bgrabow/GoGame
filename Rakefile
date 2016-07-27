desc "Default task"
task :default => :test_script

desc "Add project directory to $LOAD_PATH"
task :setup_path do 
  lib = File.expand_path("../", __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
end

desc "Run TestScript"
task :test_script => :setup_path do
  load "lib/TestScript.rb"
end

desc "Guard automatic test runner"
task :guard => :setup_path do
  system("bundle exec guard")
end

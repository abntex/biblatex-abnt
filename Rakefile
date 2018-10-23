require 'rake/clean'
require "cucumber/rake/task"

Cucumber::Rake::Task.new

desc "Executa os testes com ghostscript"
task :gs do
  Dir.chdir('tests') do
    sh './test.sh'
  end

end

task :default => 'cucumber'

CLEAN.include('tmp')

require 'rake/clean'
require "cucumber/rake/task"

Cucumber::Rake::Task.new

desc "Executa os testes com ghostscript"
task :gs do
  Dir.chdir('tests') do
    sh './test.sh'
  end
end

desc "Publica as features no site"
task :relish do
    sh "relish push pandoc-abnt"
end

task :default => 'cucumber'

CLEAN.include('tmp')

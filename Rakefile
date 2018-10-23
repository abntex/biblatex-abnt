require 'rake/clean'
require "cucumber/rake/task"

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format progress}
end

desc "Executa os testes com ghostscript"
task :gs do
  Dir.chdir('tests') do
    sh './test.sh'
  end

end

task :default => 'cucumber'

CLEAN.include('tmp')

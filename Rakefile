require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "table_to_model"
    gem.summary = %Q{Generate models from a databases tables from an Active Record Connection}
    gem.description = %Q{Using an ActiveRecord connection this tool generates the corresponding models }
    gem.email = "stefan.penner@gmail.com"
    gem.homepage = "http://github.com/stefanpenner/table_to_model"
    gem.authors = ["Stefan Penner"]
    gem.executables = ["table_to_model"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency "thor", "0.14.2"
    gem.add_dependency "activerecord",   "3.0.0"
    gem.add_dependency "activesupport",  "3.0.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "table_to_model #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

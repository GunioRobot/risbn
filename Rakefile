require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "risbn"
    gem.summary = %Q{Utils to handle isbns}
    gem.description = %Q{Utils to handle isbns}
    gem.email = "EmmanuelOga@gmail.com"
    gem.homepage = "http://github.com/EmmanuelOga/risbn"
    gem.authors = ["Emmanuel Oga", "voipscout"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency "nokogiri"
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
  rdoc.title = "risbn #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


task :fixturize do
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
  require 'risbn'
  require 'risbn/gdata'

  isbn = RISBN(ENV["ISBN"])

  if isbn.valid?
    fpath = File.join(File.dirname(__FILE__), "spec", "fixtures", "#{ENV["ISBN"]}.xml")

    File.open(fpath, "w") do |f|
      f << isbn.gdata.xml
    end
  else
    puts "provide a valid ISBN as an env var."
  end
end

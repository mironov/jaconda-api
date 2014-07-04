Gem::Specification.new do |s|
  s.name = "jaconda"
  s.version = "2.0.3"

  s.authors = ["Anton Mironov"]
  s.summary = "The official ruby wrapper for Jaconda API"

  s.email = "anton@jaconda.im"
  s.homepage = "https://github.com/jaconda/jaconda-api"

  s.require_paths = ["lib"]
  s.files = Dir['lib/**/*',
                'test/**/*',
                'jaconda.gemspec',
                'Gemfile',
                'LICENSE',
                'Rakefile',
                'README.markdown']

  s.test_files = Dir['test/**/*']
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.rdoc_options = ["--charset=UTF-8"]
  s.add_runtime_dependency("activeresource", ">= 2.3.5")
end
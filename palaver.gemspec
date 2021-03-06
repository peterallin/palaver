Gem::Specification.new do |s|
  s.name = "palaver"
  s.version = "0.0.1dev"
  s.platform = Gem::Platform::RUBY
  s.authors = [ "Peter Allin" ]
  s.email = [ "peter@peca.dk" ]
  s.summary = "Ruby interface for the 'dialog' progam"
  s.description = "Uses the 'dialog' program to create Ruby applications with text based user interfaces"
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.6"
  s.files = `git ls-files`.split "\n"
  s.require_path = "lib"
  s.homepage = "https://github.com/peterallin/palaver"
end

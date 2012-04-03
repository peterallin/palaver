Gem::Specification.new do |s|
  s.name = "conversation"
  s.version = "0.0.1"
  s.platform = Gem::Platform::RUBY
  s.authors = [ "Peter Allin" ]
  s.email = [ "peter@peca.dk" ]
  s.summary = "Ruby interface for the 'dialog' progam"
  s.description = "Uses the 'dialog' program to create Ruby applications with text based user interfaces"
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.6"
  s.files = `git ls-files`.split "\n"
  s.require_path = "lib"
end

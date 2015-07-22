# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "room_service/version"

Gem::Specification.new do |s|
  s.name        = "RoomService"
  s.version     = RoomService::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ["MIT"]
  s.summary     = "Room service is a tongue in cheek demo project for the Omaha Ruby Meetup that dynamically loads gems (installing them if necessary) when they are referenced."
  s.email       = "alec.larsen@agapered.com"
  s.homepage    = "https://github.com/anarchocurious/room_service"
  s.description = "Room service is a tongue in cheek demo project for the Omaha Ruby Meetup that dynamically loads gems (installing them if necessary) when they are referenced."
  s.authors     = ['Alec Larsen', 'The Omaha Ruby Meetup Community']

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency("activesupport", "~> 4.2.3")
end

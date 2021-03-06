spec = Gem::Specification.new do |s|
	s.name = 'funnel'
	s.version = '0.1.8'
	s.date = '2009-12-30'
	s.summary = 'A realtime resource-centric application framework'
	s.email = 'dan.simpson@gmail.com'
	s.homepage = 'http://github.com/dansimpson/funnel'
	s.description = 'A realtime resource-centric application framework'
	s.has_rdoc = false
	
	s.bindir = 'bin'
	s.executables = ['funnel']

	s.authors = ['Dan Simpson']
	s.add_dependency('eventmachine', '>= 0.12.4')

	s.files = [
	'README.markdown',
	'funnel.gemspec',
    'lib/funnel.rb',
    'lib/funnel/log.rb',
    'lib/funnel/configuration.rb',
    'lib/funnel/flash/policy.rb',
    'lib/funnel/web_socket/frame.rb',
    'lib/funnel/web_socket/headers.rb',
    'lib/funnel/web_socket/connection.rb',
    'lib/funnel/routing/route.rb',
    'lib/funnel/routing/routes.rb',
    'lib/funnel/routing/router.rb',
    'lib/funnel/server.rb',
    'lib/funnel/generators/application.rb',
    'templates/application/config/boot.rb',
    'templates/application/config/settings.yml',
    'templates/application/config/routes.rb',
    'templates/application/script/server',
    'templates/application/htdocs/test.html',
    'templates/application/handlers/debug_handler.rb',
	]
end

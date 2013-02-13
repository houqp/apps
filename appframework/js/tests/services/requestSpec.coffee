describe '_Request', ->

	beforeEach module 'OC'

	beforeEach =>
		inject (_Request, $httpBackend) =>
			@request = _Request
			@http = $httpBackend


	it 'test', ->
		# TBD

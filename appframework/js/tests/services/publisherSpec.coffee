describe '_Publisher', ->

	publisher = null
	oc_requesttoken = null
	modelMock = 
		handle: jasmine.createSpy()

	beforeEach ->
		module 'OC'
		inject (_Publisher) ->
			publisher = new _Publisher()


	it 'should publish data to subscribed model', 
		modelMock = 
			handle: (@data) ->
		data = 
			hi: 'test'

		publisher.subcribeModelTo modelMock, 'test'
		publisher.publishDataTo data, 'test'

		expect(modelMock.handle).toHaveBeenCalledWith(data)

			


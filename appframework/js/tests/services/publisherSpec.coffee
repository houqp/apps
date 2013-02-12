describe '_Publisher', ->

	beforeEach module 'OC'
	beforeEach =>
		@modelMock =
			handle: jasmine.createSpy()
	beforeEach =>
		inject (_Publisher) =>
			@publisher = new _Publisher()


	it 'should publish data to subscribed model', =>
		data = 
			hi: 'test'

		@publisher.subscribeModelTo @modelMock, 'test'
		@publisher.publishDataTo data, 'test'

		expect(@modelMock.handle).toHaveBeenCalledWith(data)
			


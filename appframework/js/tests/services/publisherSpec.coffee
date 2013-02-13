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
			

	it 'should publish not to unsubscribed model', =>
		data = 
			hi: 'test'

		@publisher.subscribeModelTo @modelMock, 'test1'
		@publisher.publishDataTo data, 'test'

		expect(@modelMock.handle).not.toHaveBeenCalledWith(data)


	it 'should publish data to multiple subscribed models', =>
		data = 
			hi: 'test'
		data2 = 
			base: 'john'
		@modelMock2 = 
			handle: jasmine.createSpy()

		@publisher.subscribeModelTo @modelMock, 'test'
		@publisher.subscribeModelTo @modelMock2, 'test'
		@publisher.publishDataTo data, 'test'

		expect(@modelMock.handle).toHaveBeenCalledWith(data)
		expect(@modelMock2.handle).toHaveBeenCalledWith(data)
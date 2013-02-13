describe 'Notification', ->

	beforeEach module 'OC'

	beforeEach =>
		inject (Notification) =>
			@notification = Notification


	it 'should have a defined router', =>
		expect(@notification).toBeDefined()

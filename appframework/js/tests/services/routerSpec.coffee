describe 'Router', ->

	beforeEach module 'OC'

	beforeEach =>
		inject (Router) =>
			@router = Router


	it 'should have a defined router', =>
		expect(@router).toBeDefined()

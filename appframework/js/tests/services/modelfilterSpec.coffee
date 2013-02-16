###

ownCloud - App Framework

@author Bernhard Posselt
@copyright 2012 Bernhard Posselt nukeawhale@gmail.com

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
License as published by the Free Software Foundation; either
version 3 of the License, or any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU AFFERO GENERAL PUBLIC LICENSE for more details.

You should have received a copy of the GNU Affero General Public
License along with this library.  If not, see <http://www.gnu.org/licenses/>.

###

describe '_ModelFilter', ->


	beforeEach module 'OC'

	beforeEach inject (_ModelFilter, _NotImplementedError) =>
		@filter = _ModelFilter
		@error = _NotImplementedError


	it 'should create a basic hash', =>
		name = 'message'
		args = [
			'a',
			1,
			1.3,
			true
		]
		filter = new @filter(name, args)

		expect(filter.hashCode()).toBe('message_a_1_1.3_true')


	it 'should escape underlines of field names to avoid collissions', =>
		filter = new @filter('message', ['test_a'])
		expect(filter.hashCode()).toBe('message_test__a')		


	it 'should throw an error when filtering', =>
		expect =>
			new @filter().exec()
		.toThrow(new @error('Not implemented'))


	it 'should have the same hash for two identical objects', =>
		name = 'message'
		args = [
			'a',
			1,
			1.3,
			true
		]
		filter1 = new @filter(name, args)
		filter2 = new @filter(name, args)

		expect(filter1.hashCode()).toBe(filter2.hashCode())
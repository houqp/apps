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

describe '_MaximumFilter', ->


	beforeEach module 'OC'

	beforeEach inject (_MaximumFilter, _Model, _ModelFilter) =>
		@filter = _MaximumFilter
		@modelFilter = _ModelFilter
		@model = _Model


	it 'should be a _ModelFilter subclass', =>
		expect(new @filter('id') instanceof @modelFilter).toBe(true)


	it 'should return undefined on empty list', =>
		filter = new @filter('id')
		expect(filter.exec([])).toBe(undefined)


	it 'should return the maximum', =>
		data1 = 
			id: 3

		data2 =
			id: 1

		data3 =
			id: 5
		
		data = [
			data1
			data3
			data2
		]
		filter = new @filter('id')

		expect(filter.exec(data)).toBe(data3)


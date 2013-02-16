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

describe '_UnequalFilter', ->


	beforeEach module 'OC'

	beforeEach inject (_UnequalFilter, _Model, _ModelFilter) =>
		@filter = _UnequalFilter
		@modelFilter = _ModelFilter
		@model = _Model
		data1 = 
			id: 3
			name: 'donovan'

		data2 =
			id: 5
			name: 'donovan'

		data3 =
			id: 2
			name: 'jack'
		
		@data = [
			data1
			data2
			data3
		]


	it 'should be a _ModelFilter subclass', =>
		expect(new @filter('id') instanceof @modelFilter).toBe(true)


	it 'should return an empty list on empty list', =>
		filter = new @filter('id', 3)
		expect(filter.exec([]).length).toBe(0)


	it 'should filter on one', =>
		filter = new @filter('name', 'donovan')

		expect(filter.exec(@data)).toContain(@data[2])


	it 'should return a list with all elements if no element is equal', =>
		filter = new @filter('name', 5)

		expect(filter.exec(@data).length).toBe(3)


	it 'should return a list with multiple entries if elements are unequal', =>
		filter = new @filter('name', 'jack')

		expect(filter.exec(@data)).toContain(@data[0])
		expect(filter.exec(@data)).toContain(@data[1])
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

angular.module('OC').factory '_Model', ->

	class Model

		constructor: ->
			@data = []
			@dataMap = {}


		add: (data) ->
			if angular.isDefined(@dataMap[data.id])
				@update(data)
			else
				@data.push(data)
				@dataMap[data.id] = data


		update: (data) ->
			for entry in @data
				if entry.id == data.id
					for key, value of data
						if key == 'id'
							continue
						else
							entry[key] = value


		getById: (id) ->
			return @dataMap[id]


		removeById: (id) ->
			counter = 0
			for entry in @data
				if entry.id == id
					@data.splice(counter, 1)
					delete @data[id]
					break
				counter += 1



		size: ->
			return @data.length


	return Model
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


# Model which offers basic crud for storing your data
angular.module('OC').factory '_Model', ->

	class Model

		constructor: ->
			@data = []
			@dataMap = {}


		handle: (data) ->
			###
			Redirects to add method
			###
			@add(data)


		add: (data) ->
			###
			Adds a new entry or updates an entry if the id exists already
			###
			if angular.isDefined(@dataMap[data.id])
				@update(data)
			else
				@data.push(data)
				@dataMap[data.id] = data


		update: (data) ->
			###
			Update an entry by searching for its id
			###
			entry = @getById(data.id)
			for key, value of data
				if key == 'id'
					continue
				else
					entry[key] = value


		getById: (id) ->
			###
			Return an entry by its id
			###
			return @dataMap[id]


		getAll: ->
			###
			Returns all stored entries
			###
			return @data


		removeById: (id) ->
			###
			Remove an entry by id
			###
			for entry, counter in @data
				if entry.id == id
					@data.splice(counter, 1)
					delete @dataMap[id]
					break


		clear: ->
			@data.length = 0
			@dataMap = {}


		size: ->
			###
			Return the number of all stored entries
			###
			return @data.length


	return Model
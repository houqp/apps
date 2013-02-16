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


angular.module('OC').factory '_Request', ->

	class Request

		constructor: (@_$http, @_$rootScope, @_publisher, @_router) ->
			@_initialized = false
			@_shelvedRequests = []

			@_$rootScope.$on 'ocRoutesLoaded', =>
				@_executeShelvedRequests()
				@_initialized = true
				@_shelvedRequests = []


		request: (route, routeParams={}, data={}, onSuccess=null,
					onFailure=null, config={}) ->
			# if routes are not ready yet, save the request
			if not @_initialized
				@_shelveRequest(route, routeParams, data, method, config)
				return

			url = @_router.generate(route, routeParams)

			defaultConfig =
				url: url
				data: data

			# overwrite default values from passed in config
			angular.extend(defaultConfig, config)

			@_$http(defaultConfig)
				.success (data, status, headers, config) =>
					if onSuccess
						onSuccess(data, status, headers, config)

					# publish data to models
					for name, value of data.data
						@publisher.publishDataTo(name, value)

				.error (data, status, headers, config) ->
					if onFailure
						onFailure(data, status, headers, config)


		_shelveRequest: (route, routeParams, data, method, config) ->
			request =
				route: route
				routeParams: routeParams
				data: data
				config: config
				method: method

			@_shelvedRequests.push(request)


		_executeShelvedRequests: ->
			for req in @_shelvedRequests
				@post(req.route, req.routeParams, req.data, req.method, req.config)



	return Request

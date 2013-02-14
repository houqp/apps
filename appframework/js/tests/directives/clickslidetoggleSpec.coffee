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

describe 'ocClickSlideToggle', ->

	beforeEach module 'OC'


	beforeEach inject ($rootScope, $compile, $window) =>
		@$rootScope = $rootScope
		@$compile = $compile
		@$window = $window


	@setOptions = (options) =>
		if angular.isDefined(options.selector)
			json = JSON.stringify(options)
			optionsString = json.replace(/\"/g, '\'')
		else
			optionsString = ""

		elm = '<div>' +
				'<div style="display: block;" ' +
				'id="a" oc-click-slide-toggle="' + optionsString + '"></div>' +
			'</div>'
		@elm = angular.element(elm)
		scope = @$rootScope
		@$compile(@elm)(scope)
		scope.$digest()

	it 'div should not be visible', =>
		@setOptions({})
		expect(@elm.find('#a').is(':visible')).toBe(true)

	xit 'click on div should slide it up', =>
		@setOptions({})
		@elm.trigger 'click', =>
		expect(@elm.find('#a').css('display')).toBe('block')


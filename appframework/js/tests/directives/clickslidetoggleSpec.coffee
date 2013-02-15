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


	beforeEach inject ($rootScope, $compile) =>
		@$rootScope = $rootScope
		@$compile = $compile
		@host = $('<div id="host"></div>')
		$('body').append(@host)


	@setOptions = (options) =>
		if angular.isDefined(options.selector)
			json = JSON.stringify(options)
			optionsString = json.replace(/\"/g, '\'')
		else
			optionsString = ""

		elm = '<div>' +
				'<div style="display: none;" id="a" ' + 
				'oc-click-slide-toggle="' + optionsString + '"></div>' +
				'<div style="display: none;" id="b"></div>' +
			'</div>'

		@elm = angular.element(elm)
		scope = @$rootScope
		@$compile(@elm)(scope)
		scope.$digest()
		@host.append(@elm)


	it 'div should not be visible', =>
		@setOptions({})
		expect(@elm.find('#a').is(':visible')).toBe(false)
		expect(@elm.find('#b').is(':visible')).toBe(false)


	it 'click on div should slide it up', =>
		options = 
			callback: =>
				expect(@elm.find('#a').is(':visible')).toBe(true)
		
		@setOptions(options)
		@elm.find('#a').trigger 'click'


	it 'click on div should slide it up other element if selector is passed', =>
		options = 
			selector: '#b'
			callback: =>
				expect(@elm.find('#b').is(':visible')).toBe(true)	

		@setOptions(options)
		@elm.find('#a').trigger 'click'
			


	afterEach =>
		@host.remove()
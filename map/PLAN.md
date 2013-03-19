# Map app for ownCloud

## Basic features

Following features have already been implemented by eMerzh:

* when user clicked into the app, they should see a map!
  * The map should take over the whole content area
* provide a search bar so user can search for location and update the view in the map
* add place bookmark

Following features haven't been implemented yet:

* center map to user's location on app start
* get direction
* place bookmark management (delete, rename, share, etc)
  * not sure whether we should implement this feature in bookmark app though
  * give tags to bookmarks (good restaurants, bars that sucks, etc)
* route management (add, share, etc)
* communication API for OC apps and other map applications
* connect map app with calendar app
  * so users can see events' location on a small embedded map.
* connect map app with contact app
  * so users can see people's location on a small embedded map.


## Possible extensions
* using map app for device tracking
  * integrate with ownPrey app
  * last known location of my device
  * real time device location tracking
* connect map app with imageviewer app?
  * show images based on it's taken location on the map (good for showcase pictures taken during travel)
* fetch data from services like scheme and display events on the map?


## Attack Plan

* port current map app to new appframework, using AngularJS of course :)
* implement map app's own basic features:
  * bookmark management
  * getting directions
  * route management
* design and implement map app API for other OC apps to use
  * the first usage of the API can be showing location in calendar's events
  * show people's location in contact app
* design and implement map app API for other general applications (marble for example)
  * see if we can coordinate with marble GSoC project at KDE side for this part
* if I got extra time, pick some of the extensions to hack on

Notice that writing documentation and unit testing are not included in the plan
above, because they should be taken care of in every step :)

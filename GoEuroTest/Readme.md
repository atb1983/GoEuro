What's better than a real-life case?

Implement an application that consist of one screen containing our 3 travel modes (Train, Buses & flights) that we offer at GoEuro. The view has 3 tabs, each representing one of the three travel options we display in our results. There’s no specific design for the cells but the list has to be clear & readable for the user and should display the following:

logo
departure time
arrival time
number of changes
price
duration
And to get the lists, we have created these 3 handy APIs for you:

https://api.myjson.com/bins/w60i for flights
https://api.myjson.com/bins/3zmcy for trains
https://api.myjson.com/bins/37yzm for buses
For image sizes, please keep it 63 for example http://cdn-goeuro.com/static_content/web/logos/63/megabus.png

----------------------------------------------------------------------
If there is no data available in the returned json file then try to find how you can make a proper calculation for it.
	- I don't fully understand this point
----------------------------------------------------------------------

Each list should be ordered by departure time and offer the opportunity to switch the order to arrival time or duration. Tapping an offer button should display an "Offer details are not yet implemented!" message to the user. Your app should also work offline, so try to cache in the data.

Implement your solution as an app that we can try out. It should be compatible with iOS 7 and different iPhone screen sizes. Also send us the source code of your solution. We use GitHub, so it would be much better if you can upload it to a remote Github repositery.

----------------------------------------------------------------------
Xcode 8.1 doesn't support iOS7 anymore.  if this is a really important required, please let me know and I will try to get an old version of Xcode, I was carefully and I didn't add any method or storyboard option that would break compatibility with iOS7. 
----------------------------------------------------------------------

Please provide information for any third party library and tool you are using and use Objective-C as the main language.

----------------------------------------------------------------------
I'm using Cocopods 
AFNetworking
and MBProgressHUD
I tried to about using too many 3rd party libraries for this exercice
----------------------------------------------------------------------

Bonus points: Can you use Objective-C and SWIFT together? Show us a sample. A clean, well-animated, beautiful UI is very important. Please, go wild and let your imagination fly here (hint, use more than standard animations).

Hint You may use the following design as a reference, however you are totally free to use your creativtiy and imagination. https://github.com/goeuro/iOS-Test/blob/master/expected_output.png

We understand that this coding exercise is not the most important thing in life! Therefore, please don´t spend more than 2-3 hours on it and reduce the scope, if needed. :)

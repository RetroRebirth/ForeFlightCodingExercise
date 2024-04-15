# ForeFlightCodingExercise
An iOS app that fetches and displays the weather report for a given airport from ForeFlight's QA server.

## How long was spent on the project

Started 9:00am Monday April 15th. Setting up my dev environment including installing OS X Yosemite v10.10.15 and Xcode v7.2 took until 10:30am.

## Any notable design decisions you wish to highlight

TODO

## Any references consulted and/or third party libraries used

### https://www.toptal.com/developers/gitignore/

Used to produce the .gitignore file.

### https://www.shrikar.com/blog/swift-ios-tutorial-uisearchbar-and-uisearchbardelegate

Tutorial referenced to generate a search bar and table view with filtering search.

### https://developer.apple.com/documentation/uikit/uisearchbar & https://developer.apple.com/documentation/uikit/views_and_controls/table_views

Apple docs referenced for better understanding `UISearchBar` and table views.

### https://developer.apple.com/documentation/foundation/nsmutableurlrequest

Apple docs for generating a URL request pre Swift 3.

### https://stackoverflow.com/questions/28302019/getting-a-this-application-is-modifying-the-autolayout-engine-from-a-background

Stackoverflow for dispatching to main queue for updating UI in pre Swift 3

## Known issues

- Refactor `UISearchBarDelegate`, `UITableViewDataSource`, and `UITableViewDelegate` methods to separate files.
- Selecting an airport from the table does nothing.

## Any other notes that will help us understand your project

TODO

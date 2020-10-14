# Twitter-Clone



Twitter Clone by Valerie Don

Description:
A Twitter clone that has a home newsfeed with tweets, a tweet detail page with comments following the tweet, and a profile page with all of the user’s tweets.

Project Requirements:
Given 2-4 hours, create an app that fetches data from the server to display posts, display comments that go with the posts, and display all posts made by a user.

What I've Accomplished So Far:
- Fetched posts data from server
- Fetched comments from server
- Parse posts data and comments data
- Create three view controllers displaying different data
- Reused tableview cell FeedTableViewCell for all tableviews
- Allowed username and profile image icon to take user to profile page from any view controller
- Prettified app with no designs and with time, data, and project information constraints
- Tested with real users and received useful feedback that I used to improve UX

Assumptions:
- Assumed that app will be in portrait mode, never in landscape
- Assumed that app will only be in light mode. Not configured for dark mode
- Assumed that this app is supporting iOS 10 and up
- Assumed that this app will not be fetching continuous updates like a real twitter clone would

What's Left to do:
- Create a reusable tableview class so that we don't have to use three different view controllers, we might just need two instead of three
- Minor UI improvements like adding a twitter handle (ex. @timcook) underneath username

Technologies Used:
- Alamofire

Special Gotchas:
- Passing data between view controllers to be able to take the user to the Profile page was a tricky one. I wanted my users to be able to click on any account name and profile image to be taken directly to the page with all of the account tweets (AuthorPostsViewController), but one of the view controllers didn’t have the data to pass around (PostDetailViewController). I implemented a protocol and adopted the protocol on the view controller with data (ViewController) to send data to AuthorPostsViewController and present it as well, rather than presenting the it from the view controller without data (PostDetailViewController).

- PostDetailViewController was a tricky one as well since I wanted to display the original post the user clicked on and show all of the comments. I figured out how to add another tableview cell inside of the tableview and display all of the comments beneath it in using a custom tableview cell.

- There was not a lot of data to work with so I improvised and added some usernames to make the app feel more lively! Had some friends play around with the app to see how I could make it better. When they opened up the first prototype of this app they had no idea what it’s purpose was, so I added a Twitter icon and usernames to make it feel more intuitive, and look more like Twitter.












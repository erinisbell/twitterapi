[![Code Climate](https://codeclimate.com/repos/563a36436956801ecb00281e/badges/8698695400aee4779dc8/gpa.svg)](https://codeclimate.com/repos/563a36436956801ecb00281e/feed)
[![Test Coverage](https://codeclimate.com/repos/563a36436956801ecb00281e/badges/8698695400aee4779dc8/coverage.svg)](https://codeclimate.com/repos/563a36436956801ecb00281e/coverage)
[![Build Status](https://travis-ci.org/erinisbell/twitterapi.svg)](https://travis-ci.org/erinisbell/twitterapi)


For this Twitter API, a user will be able to be created with the payload of an email and password, then will be able to login which will generate a token used to authenticate the user in order to create tweets. For each of these actions, a POST will need to be used in the HTTP type request.

##Users

URL:

GET -- https://twitterapii.herokuapp.com/users (This will allow you to see all users)   
POST-- https://twitterapii.herokuapp.com/users

Sign Up A User:
Each of the things needed (aka payload) in order for a user to sign up is an email and password.Here is an example of what the json looks like that will be used:

```javascript
  {"user": {
     "email": "user@example.com",
     "password": "password"
  }}
```

##Auth

URL:

POST-- https://twitterapii.herokuapp.com/oauth/token

Once a user is signed up, they will need to log in with the payload of grant_type, username, and password. From this a token will be created and will be needed to be put into a header. Each token will be good for two hours.
Here is an example of the json of logging in:
```javascript
{
     "grant_type": "password",
     "username": "user@example.com",
     "password": "password"
   }


```

##Tweets

URL:

GET -- https://twitterapii.herokuapp.com/tweets (This will allow you to see all tweets)  
POST -- https://twitterapii.herokuapp.com/tweets

A token will be generated and needed to be put into the header of the tweets url.
Using this token, the user will be able to create a tweet with the payload of a body. Here is an example of the json:

```javascript
{"tweet" : {
    "body": "This is a tweet"
 }
}

```

This project has pagination with the parameters of size and page in order to get to the next page. The URL would look something similar to this: https://twitterapii.herokuapp.com/users and the second page would have users?page=2 or whichever number page you're wanting to link to.

##Follow/Unfollow

Users are able to follow and unfollow other users using https://twitterapii.herokuapp.com/users/(user_id)/follow
or https://twitterapii.herokuapp.com/users/(user_id)/unfollow.

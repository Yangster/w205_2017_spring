import tweepy

consumer_key = "j4N3AqVFEHdQRy1cQAgGTPlGt";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "7msmJZI6ausLSfSJia4rXhnhjJe9UkSPsrKlEkMAhf0Y4EmcjQ";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "461173099-lNKzJs2Qk9v7zHGC0mWLjYOe07vC8EkGIfbvvZos";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "o6lLCMyoAO9vW2smvvv9Eg8a1bYiJz7K4VhzotFVdLBVD";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)




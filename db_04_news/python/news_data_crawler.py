'''
CS3810 - Principles of Database Systems - Spring 2022
Instructor: Thyago Mota
Student Name:
'''

import http.client
import pymongo
import json
import time

# definitions
PREEMPTIVE_BACKOFF_TIME = 2
PAGE_SIZE               = 10
NEWS_API_URL            = 'newsapi.org'

def read_config_properties():
    prop = {}
    with open('config.properties', 'rt') as f:
        for line in f:
            key, value = line.strip().split('=')
            prop[key] = value
    return prop

# implements a news API data crawler, saving news articles in a MongoDB database
class NewsDataCrawler:

    def __init__(self):
        prop     = read_config_properties()
        user     = prop['user']
        password = prop['password']
        server   = prop['server']
        self.api_key  = prop['news_api_key']
        self.client = pymongo.MongoClient(f'mongodb+srv://{user}:{password}@{server}/?retryWrites=true&w=majority')
        self.collection = self.client.db04.articles

    # TODO: call the news search API to retrieve news articles of the given topic, using parameters page and page_size; insert all articles returned into a MongoDB collection named "articles"
    def search_articles(self, topic, page_size, page):
        pass

    def done(self): 
        self.client.close()

# TODO: write an application that asks the user for a topic and retrieves 100 news articles from that topic, saving them in a MongoDB database; make sure to pause for 2m between API calls to avoid having your API key being locked out
if __name__ == "__main__":
    pass
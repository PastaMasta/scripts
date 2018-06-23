#! /usr/bin/python

import json
import urllib2
import os

user = 'pastamasta'

def clone_repos(user):
  response = urllib2.urlopen("https://api.github.com/users/" + user + "/repos")
  data = json.loads(response.read())
  for i in data:
    print "Cloning: " + i['clone_url']
    os.system("git clone " + i['clone_url'])
    print "\n"

clone_repos(user)

import json
import urllib

url = raw_input("Enter URL: ")

print 'Retrieving', url
uh = urllib.urlopen(url)
data = uh.read()
print 'Retrieved',len(data),'characters'
info = json.loads(data)
info = info['comments']

answerCount = 0
answerSum = 0


for item in info:
  answerSum = answerSum + int(item['count'])

print "Count: ", answerCount
print "Sum: ", answerSum
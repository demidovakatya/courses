import urllib
from bs4 import *

html = urllib.urlopen("http://pr4e.dr-chuck.com/tsugi/mod/python-data/data/comments_181148.html").read()
soup = BeautifulSoup(html)

tags = soup('span')
answer = 0
for tag in tags:
   answer = answer + int(tag.contents[0])

print answer
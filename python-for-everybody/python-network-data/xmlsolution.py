import urllib
import xml.etree.ElementTree as ET

url = raw_input('Enter URL: ')
uh = urllib.urlopen(url)
data = uh.read()
tree = ET.fromstring(data)
counts = tree.findall('.//count')
answer = 0

for count in counts:
    answer = answer + int(count.text)

print answer
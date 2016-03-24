# The basic outline of this problem is to read the file, look for integers using the re.findall(), looking for a regular expression of '[0-9]+' and then converting the extracted strings to integers and summing up the integers.

import re
sample = open("regex_sum_181143.txt")

integers = list()
text = ""

for line in sample:
	text = text + " " + line.rstrip()
	integers = re.findall("[0-9]+", text)
    # integers.append(num)
	# return integers

# print integers

integers = map(int, integers)
answer = sum(integers)

print answer
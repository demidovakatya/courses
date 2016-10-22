import string
PATH_TO_FILE = 'words.txt'

def loadWords():
	inFile = open(PATH_TO_FILE, 'r', 0)
	line = inFile.readline()
	wordlist = string.split(line)
	print ("  ", len(wordlist), "words loaded.")
	return wordlist

loadWords()

# Uncomment the following function if you want to try the code template
# def loadWords2():
# 	try:
# 		inFile = open(PATH_TO_FILE, 'r', 0)
# 	#line of code to be added here#
# 		print "The wordlist doesn't exist; using some fruits for now"
# 		return ['apple', 'orange', 'pear', 'lime', 'lemon', 'grape', 'pineapple']
# 	line = inFile.readline()
# 	wordlist = string.split(line)
# 	print "  ", len(wordlist), "words loaded."
# 	return wordlist
# PATH_TO_FILE = 'words2.txt'
# loadWords2()
# PATH_TO_FILE = 'doesntExist.txt'
# loadWords2()

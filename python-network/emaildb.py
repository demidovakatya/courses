import sqlite3

conn = sqlite3.connect('emaildb.sqlite')
cur = conn.cursor()

cur.execute('''
    DROP TABLE IF EXISTS Counts''')

# create a table 
cur.execute('''
    CREATE TABLE Counts (email TEXT, count INTEGER)''')

# prompt the filename
fname = raw_input("Enter file name: ")
# if empty
if ( len(fname) < 1 ) : fname = 'mbox-short.txt'
# 
fh = open(fname)

for line in fh:
    # if it doesn't start with "From: ", it's irrelevant
    if not line.startswith('From: ') : continue
    pieces = line.split()
    # pieces = ["From:", "email", "stuff"...]
    email = pieces[1]
    # a question mark = placeholder, like %d
    # needs a tuple
    cur.execute('SELECT count FROM Counts WHERE email = ?', (email, ))
    try:
        # fetchone() brings us back 1 row into memory and gives it as a list
        # select 0th list element because we've SELECTed count (1 column)
        # and this 0th element is the only thing we need
        count = cur.fetchone()[0]
        # if the email is already in the DB, update its counts 
        cur.execute('UPDATE Counts SET count=count+1 WHERE email = ?', (email, ))
    # if 0 rows were SELECTed, fetchone() will throw and error
    # in this case we add a new row for the given email
    except:
        # add a row (email: %email%, count: 1)
        cur.execute('INSERT INTO Counts (email, count) VALUES (?, 1)', (email, ))
    # make everything we've written come true
    conn.commit()
# the loop fills table Counts with email addresses and corresponding email counts

# select 10 emails with the largest counts (create a top-10 contributors chart)
# sqlstr = 'SELECT email, count FROM Counts ORDER BY count DESC LIMIT 10'
sqlstr = 'SELECT email, count FROM Counts ORDER BY count DESC' # playing around

for row in cur.execute(sqlstr):
    # str[0] is email, str[1] is count
    print str(row[0]), row[1]

cur.close()



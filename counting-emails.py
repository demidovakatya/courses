import sqlite3

conn = sqlite3.connect('counting-emails.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Counts')
cur.execute('CREATE TABLE Counts (org TEXT, count INTEGER)')

fh = open('mbox.txt')

for line in fh:
    if not line.startswith('From: ') : continue
    pieces = line.split()
    email = pieces[1]
    org = email[email.find("@") + 1:]
    cur.execute('SELECT count FROM Counts WHERE org = ?', (org, ))
    try:
        count = cur.fetchone()[0]
        cur.execute('UPDATE Counts SET count=count+1 WHERE org = ?', (org, ))
    except:
        cur.execute('INSERT INTO Counts (org, count) VALUES (?, 1)', (org, ))
    conn.commit()

sqlstr = 'SELECT org, count FROM Counts ORDER BY count DESC'

for row in cur.execute(sqlstr):
    print str(row[0]), row[1]

cur.close()



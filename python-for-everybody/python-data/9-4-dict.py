name = raw_input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)
d = dict()

for line in handle:
    if line.startswith('From '):
        w = line.split()
        if w[1] in d:
            d[w[1]] = d[w[1]] + 1
        else:
            d[w[1]] = 1

most = None
for key in d:
    if most is None or d[key] > d[most]:
        most = key

print most, d[most]
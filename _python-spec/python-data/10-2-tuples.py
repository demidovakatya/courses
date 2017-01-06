name = raw_input("Enter file: ")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)
hours = {}

# handle = open("mbox-short.txt")
for line in handle:
    if line.startswith('From '):
        hour = line.split()[-2].split(':')[0]
        if hour in hours:
            hours[hour] = hours[hour] + 1
        else:
            hours[hour] = 1

hours = sorted(hours.items())

for hour, count in hours:
    print hour, count

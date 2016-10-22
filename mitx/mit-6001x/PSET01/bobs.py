bob = "bob"
# s = "azcbobobegghakl"

num_bobs = 0

for pos in range(0, len(s) - 2):
    if s[pos] == "b":
        if s[pos+1] == "o" and s[pos+2] == "b":
            num_bobs += 1

print("Number of times bob occurs is: " + str(num_bobs))

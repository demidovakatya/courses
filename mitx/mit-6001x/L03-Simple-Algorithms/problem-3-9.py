low = 0
ans = 50
high = 100

print "Please think of a number between 0 and 100!"
print "Is your secret number: " + str(ans) + "?"

user_answer = raw_input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly. ")

while user_answer != 'c':
    if  user_answer == 'h':
        high = ans
        ans = int((ans + low)/2)
    elif user_answer == 'l':
        low = ans
        ans = int((ans + high)/2)
    else:
        print"Sorry, I did not understand your input."
    print "Is your secret number: " + str(ans) + "?"
    user_answer = raw_input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly. ")
if user_answer == 'c':
    print "Game over. Your secret number was:" + str(ans)

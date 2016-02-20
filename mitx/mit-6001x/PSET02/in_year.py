# Test Case 1:
balance = 3329
annualInterestRate = 0.2

monthlyInterestRate = annualInterestRate / 12

payment = 10

while True:
    rem_balance = balance
    for month in range(1,13):
        rem_balance = (rem_balance - payment) * (monthlyInterestRate + 1)
    if rem_balance > 0:
        payment += 10
    else:
        break

print("Lowest payment: " + str(payment))

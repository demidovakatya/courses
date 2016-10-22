# Test Case 1:
balance = 320000
annualInterestRate = 0.2

monthlyInterestRate = annualInterestRate / 12.0
rem_balance = balance

lower = balance / 12
upper = balance * (1 + monthlyInterestRate) ** 12 / 12.0
payment = (lower + upper) / 2

while abs(rem_balance) > 0.01:
    payment = (lower + upper) / 2
    rem_balance = balance

    for month in range(1,13):
        rem_balance = (rem_balance - payment) * (monthlyInterestRate + 1)

    if rem_balance > 0:
        lower = payment
    else:
        upper = payment

print("Lowest payment: " + str(round(payment, 2)))

# test case 1
balance = 4213
annualInterestRate = 0.2
monthlyPaymentRate = 0.04

monthlyInterestRate = annualInterestRate / 12

total_paid = 0

for current_month in range(1,13):
    print("Month: " + str(current_month))
    minMonthlyPayment = balance * monthlyPaymentRate
    total_paid += minMonthlyPayment
    print("Minimum monthly payment: " + str(round(minMonthlyPayment, 2)))
    # Updated balance each month = (Monthly unpaid balance) +
    # (Monthly interest rate x Monthly unpaid balance)
    balance = (balance - minMonthlyPayment) * (monthlyInterestRate + 1)
    print("Remaining balance: " + str(round(balance, 2)))

print("Total paid: " + str(round(total_paid, 2)))
print("Remaining balance: " + str(round(balance, 2)))

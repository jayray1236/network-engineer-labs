# house_down_payment_calculator.py
# Beginner Python lab: calculate down payment based on buyer credit status

print("House Down Payment Calculator")

house_price = float(input("Enter the house price: $"))
buyer_credit = input("Does the buyer have good credit? Enter yes or no: ").lower()

if buyer_credit == "yes":
    down_payment_percent = 0.10
else:
    down_payment_percent = 0.20

down_payment = house_price * down_payment_percent

print(f"House price: ${house_price:,.2f}")
print(f"Down payment percentage: {down_payment_percent * 100:.0f}%")
print(f"Required down payment: ${down_payment:,.2f}")

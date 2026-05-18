# weight_converter.py
# Beginner Python lab for converting weight between pounds and kilograms

print("Weight Converter")
print("Choose one option:")
print("1. Convert pounds to kilograms")
print("2. Convert kilograms to pounds")

choice = input("Enter 1 or 2: ")

if choice == "1":
    pounds = float(input("Enter weight in pounds: "))
    kilograms = pounds * 0.453592
    print(f"{pounds} pounds is equal to {kilograms:.2f} kilograms.")

elif choice == "2":
    kilograms = float(input("Enter weight in kilograms: "))
    pounds = kilograms / 0.453592
    print(f"{kilograms} kilograms is equal to {pounds:.2f} pounds.")

else:
    print("Invalid choice. Please run the program again and enter 1 or 2.")

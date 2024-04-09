import re

def check_credit_card(number):
    # Regex pattern to validate the credit card number
    pattern = r"^(?!.*(\d)(-?\1){3})[456]\d{3}(-?\d{4}){3}$"
    clean_number = number.replace("-", "")
    return re.match(pattern, number) and len(clean_number) == 16

# STDIN
n = int(input().strip())
for _ in range(n):
    card_number = input().strip()
    # Print output to STDOUT
    print("Valid" if check_credit_card(card_number) else "Invalid")

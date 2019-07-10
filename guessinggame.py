secret_word = 'viki'
guess = ''
guess_count = 0
guess_limit = 3
outof_guesses = False
while guess != secret_word and not outof_guesses:
    if guess_count < guess_limit:
        guess = input("Enter the word  :")
        guess_count += 1
    else :
        outof_guesses = True
if outof_guesses:
    print("You are out of guesses, You loose !")
else:
    print("You guessed it right,YOU WIN!")

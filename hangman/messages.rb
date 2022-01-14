module GameMessages
  def msg_new_game
    print "Welcome to Hangman\n" \
    "Try to guess the secret word.\n\n"
  end

  def msg_new_guess
    print "\nEnter a new guess: "
  end

  def msg_invalid_input
    print 'Invalid. Try again: '
  end

  def msg_you_win
    puts "\nYou Win!"
  end

  def msg_you_lose(secret_word)
    puts "\nYou Lose\n"\
    "The secret word was: #{secret_word}"
  end
end

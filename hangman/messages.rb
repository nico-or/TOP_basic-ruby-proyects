# frozen_string_literal: true

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
end

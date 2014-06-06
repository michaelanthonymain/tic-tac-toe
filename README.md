tic-tac-toe
===========
This is designed to be an unbeatable Tic Tac Toe game built in Ruby and played through the Terminal.

In order to play:

  1. Clone this repo.
  2. Navigate to the directory in your terminal.
  3. Type ``` ruby game.rb ```
  4. Choose if you want to go first or second.
  5. Enjoy!

In order to run specs:

  1. Open up ```game.rb```
  2. Comment out this line: ```game.set_order(UserPrompter::choose_order)``` (This is line 149, all the way at the bottom).
  3. Then run ```rspec spec``` from terminal.
  4. Don't forget to uncomment that line when you want to play again!



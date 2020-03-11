### 1. Solution Approach:

I have Followed the Warnsdorff’s Algorithm approach to solve the problem.

1. Build the 10*10 Board with unvisited(-1)
2. prepare all possible patterns
       row_pattern = [3, 2, 0, -2, -3, -2, 0, 2] 
       col_pattern  = [0, -2, -3, -2, 0, 2, 3, 2]
3. Pawn can start from any valid position on the board.  
4. By using the above pattern. get the unvisited(-1) tile with minimal degree from the current position
5. Once find the next position, update the position in board as visited.  
6. Keep continue step 4 and 5 until all the tiles got visited

  note: Board is in one dimensional array, Index calculation will be 
         board[col * BOARD_SIZE + row] 

### 2. App setup and run the App: 
   
1. Required ruby 2.5.1
2. unzip the app folder and go to app path.
3. Run bundle install
    $ bundle install
4. Run the application with below command. pass the row and col values of the initial position, 
   if no arguments passed  by default 0,0 will be considered.
    $ ruby lib/visit.rb 3 2

## 3. Running Unit test cases:   
 	   $ rspec spec/pawn_tour_spec.rb

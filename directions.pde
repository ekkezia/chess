void up(int i) {
    pieces[i + offsetWhichPlayer].move(0, -1);
}

void down(int i) {
    pieces[i + offsetWhichPlayer].move(0, 1);
}  

void left(int i) {
    pieces[i + offsetWhichPlayer].move(-1, 0);
}

void right(int i) {
    pieces[i + offsetWhichPlayer].move(1, 0); 
}

void drawChessBoard() {
  noStroke();
    for (int x = 0; x < width/8; x++) {
       for (int y = 0; y < height/8; y++) {
         if((x % 2 == 0) && (y % 2 != 0)) {
           fill(100);
         }
         else if (((x % 2 != 0) && (y % 2 == 0))) {
           fill(100);                                                                                        
         }
         else {
           fill(255);
         }
           rect(x * (width/8), y * (height/8), width/8, height/8);
         }
    }
}

void drawChessPieces() {
  // White Pieces
  for (int i = 0; i < 16; i++) {
     pieces[i].put("WHITE");
  }
  // Black Pieces
  for (int i = 16; i < 32; i++) {
     pieces[i].put("BLACK");
  }
}

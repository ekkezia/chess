void up(int i) {
  //yPoss[i] -= width/8;
  pieces[i].move(0, -1);
  print("up");
}

void down(int i) {
  //yPoss[i] += width/8;
  pieces[i].move(0, 1);
}

void left(int i) {
  //xPoss[i] -= width/8;
  pieces[i].move(-1, 0);
}

void right(int i) {
  //xPoss[i] += width/8;
  pieces[i].move(1, 0);
}


void select(int whichPiece) {
  // ADD checker if the value just now is whithin the range of MIDI?
  pieces[whichPiece].select(); 
}

void drawChessBoard() {
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

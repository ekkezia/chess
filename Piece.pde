class Piece {
  Piece (String type, int x, int y, boolean selected) {
    text(type, x, y);
    noStroke();
    fill(255,0,0);
    ellipse(width/8/2 + x, width/8/2 + y, width/8, height/8);   
    if (selected) {
      noFill();
      stroke(0, 255, 0);
      rect(x, y, width/8, height/8);
    }
  }
}

void chessPiece(String type, int x, int y) {
    text(type, x, y);
    fill(255,0,0);
    ellipse(width/8/2 + x, width/8/2 + y, width/8, height/8);    
}

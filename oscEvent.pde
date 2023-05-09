// This value is set by the OSC event handler
float amplitude = 0;
// Declare a scaling factor
float scale=6;
// Declare a smooth factor
float smooth_factor=0.1;

int whichPiece = 0;

void oscEvent(OscMessage theOscMessage) {
    float value = theOscMessage.get(0).floatValue();
    //String dirValue = theOscMessage.get(1).stringValue();
    println("OSC", value);
    if (theOscMessage.checkAddrPattern("/amp")) {
      switch(int(value)) {
        case 62: // top left
          up(whichPiece);
          left(whichPiece);
          break;
        case 63:
          up(whichPiece);
          break;
        case 64:
          up(whichPiece);
          right(whichPiece);
          break;
        case 65:
          left(whichPiece);
          break;
        case 67:
          right(whichPiece);
          break;
        case 69:
          print("touch");
          down(whichPiece);
          left(whichPiece);
          break;
        case 70:
          down(whichPiece);
          break;
        case 71:
          down(whichPiece);
          right(whichPiece);
          break;
      }
        if (value > 0) {
            amplitude = value/ 10;
        } else {
            amplitude = 0.0;
        }
    }
    
     if (theOscMessage.checkAddrPattern("/piece")) {
        
     }
}

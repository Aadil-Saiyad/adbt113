String plaintext = ("");
String ciphertext = ("");
String hold = ("");
String combNum;

float x = 150;
float y = 250;
float w = 200;
float h = 50;

int opacity = 255;
int shift = 0;
int shiftNum;

char alphabet;

//////////////////////////////////////////////////////////////////////////
void setup()
{
  size (500, 500);
  textSize (20);
}

//////////////////////////////////////////////////////////////////////////
void draw()
{
  background (0, 0, 0);
  String instructions = "           Type in a password, press ENTER, \nType a number and press the BUTTON to Encrypt";
  String plainTextMessage = "Plaintext message :   \nShift number :" ;
  String cipherTextMessage = "Encrypted Password : " ;
  String button = "Press to Encrypt!";
  fill (0, 255, 0);

  text (instructions, 10, 40);
  text (plainTextMessage, 20, 120);
  text (cipherTextMessage, 150, 350);
  text (plaintext, 300, 120);
  text (ciphertext, 200, 400);

  rect(x, y, w, h, 100);

  fill (0);
  text (button, 170, 280);
}

void mousePressed()
{
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
      cipher();
      fill(0, 255, 255);
    }
  }
}

//////////////////////////////////////////////////////////////////////////
void keyPressed() 
{

  shiftNum = Character.getNumericValue(key);
  if (shiftNum<=9 && shiftNum>0)shift = shiftNum; 
  
  hold += shift;

  plaintext += key;
}

////////////////////////////////////////////////////////////////////////
void cipher()
{

  for (int i=0; i < plaintext.length(); i++) 
  {

    alphabet = plaintext.charAt(i);


    if (alphabet >= 'a' && alphabet <= 'z') 
    {

      alphabet = (char) (alphabet + shift);


      if (alphabet > 'z') 
      {

        alphabet = (char) (alphabet+'a'-'z'-1);
      }

      ciphertext = ciphertext + alphabet;
    } else if (alphabet >= 'A' && alphabet <= 'Z') {

      alphabet = (char) (alphabet + shift);    


      if (alphabet > 'Z') {


        alphabet = (char) (alphabet+'A'-'Z'-1);
      }
      ciphertext = ciphertext + alphabet;
    } else {
      ciphertext = ciphertext + alphabet;
    }
  }

  //splits the strings into different array into 0s and non 0s
  String[] result = split(hold, "0");

  //joins all non 0s together
  combNum = join(result, "");

  //slices first to last letter of the message
  String slice = ciphertext.substring(0, plaintext.length()-combNum.length());

  ciphertext = slice;
}

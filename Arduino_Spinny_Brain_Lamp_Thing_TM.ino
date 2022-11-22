
/*
   -might need to mess with serial monitor timeout if there's a long time between clicking

   Rough Plan:
   1) get lights and interface working
   2) create a housing/make the brain
   3) write the FRQ
   4) see if we have enough time to make it spin
*/
//light pins
int sections[8] = {53, 49, 43, 37, 33, 31, 27, 23};
/*
   0- brainstem
   1- cerebellum
   2- dencephalon
   3- limbic system
   4- frontal lobe
   5- parietal lobe
   6- temporal lobe
   7- occipital lobe
*/

int selection = -1;
boolean first = true;

void setup() {
  //initializing all leds as output
  for (int i = 0; i < 8; i++)
  {
    pinMode(sections[i], OUTPUT);
  }

//  establishConnect();
  Serial.begin(9600);

//  //asks user to select a part of the brain to light up
//  Serial.println("Select a brain section by entering the corresponding number: \n"
//                 "1- brainstem\n"
//                 "2- cerebellum\n"
//                 "3- diencephalon\n"
//                 "4- limbic system\n"
//                 "5- frontal lobe\n"
//                 "6- parietal lobe\n"
//                 "7- temporal lobe\n"
//                 "8- occipital lobe\n" );

}

void loop() {

  //waits for user to answer
  while (Serial.available() == 0)
  {
  }

 // selection = Serial.parseInt();//will need to delete this and use bit below but just using it rn because processing's sending 0s
 // Serial.println(selection);
  
//
//  //stores input from user
  int selectionTemp = selection;
//  selection = Serial.parseInt() - 1;
  selection = Serial.read() - 1;
  //selection = Serial.parseInt();
  //for some reason it likes to loop through the whole thing again and reset it to zero after setting it to the input
  //so if it sets it to 0, (which becomes negative 1), it gets set back to the previous value
  if (selection == -1)
  {
    selection = selectionTemp;
  }

  //searches for any lights turned on and turns them off
  for (int i = 0; i < 8; i++)
  {
    if (digitalRead(sections[i]) == HIGH)
    {
      digitalWrite(sections[i], LOW);
      break;
    }
  }

  //turns selected light on
  digitalWrite(sections[selection], HIGH);

}

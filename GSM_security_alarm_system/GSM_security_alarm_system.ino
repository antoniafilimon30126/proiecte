
#include <SoftwareSerial.h>
SoftwareSerial mySerial(1, 0);


int pirsensor = 10;
int buzzer = 12;

void setup() {
  randomSeed(analogRead(0));
  Serial.begin(9600);
 mySerial.begin(9600); // original 19200. input 9600 for sim800L
  Serial.println(" logging time completed!"); //the initialization of the components was carried out successfully
  pinMode(pirsensor, INPUT); //component location
  pinMode(buzzer, OUTPUT);
  pinMode(redled, OUTPUT);
digitalWrite(buzzer, LOW); //at the beginning, the buzzer is initialized with 0 

  delay(100);

}

void loop() {


  if ( digitalRead(pirsensor) == HIGH) 
  { digitalWrite(buzzer, HIGH); //once the motion sensor has detected, the buzzer will activate
   Serial.println("making call"); //the information to make the call is sent
   
    mySerial.println("AT"); //once the test is successful, it will return OK
  updateSerial();
  
  mySerial.println("ATD+ +40748137033;"); //call the number
  updateSerial();
  delay(20000); // wait 20 seconds to be sure that the owner hears the phone ringing
  mySerial.println("ATH"); //hang up
  updateSerial();

   delay(2000);
  }
  if ( digitalRead(pirsensor) == LOW) //after making the call and notifying the owner, the alarm stops
  {
    digitalWrite(buzzer, LOW);
    digitalWrite(redled, LOW);
   ;
    delay(1000);
  }

}




void updateSerial()
{
  delay(500);
  while (Serial.available()) 
  {
    mySerial.write(Serial.read());//Redirects what it received to the software serial port
  }
  while(mySerial.available()) 
  {
    Serial.write(mySerial.read());//Redirectioneaza ceea ce a primit la portul serial software
  }
}

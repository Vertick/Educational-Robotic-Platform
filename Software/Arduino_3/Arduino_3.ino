/**************************************************************************************************/
/* File name: Arduino 3                                                                           */
/**************************************************************************************************/
/* Author name: Pedro Plaza                                                                       */
/**************************************************************************************************/
/* Second version 1.1 - 31/01/2019                                                                */
/**************************************************************************************************/

const int OUTPUT_1 =  2;// OUTPUT_1 set to D2 pin
const int OUTPUT_2 =  4;// OUTPUT_2 set to D4 pin
const int OUTPUT_3 =  7;// OUTPUT_3 set to D7 pin
const int INPUT_1  =  8;// INPUT_1 set to D8 pin
const int INPUT_2  =  12;// INPUT_2 set to D12 pin
const int INPUT_3  =  13;// INPUT_3 set to D13 pin

const int ARDUINO_ID = 3;// Arduino identifier
int initialized = 0; // Variable to detect the start-up
int seconds_counter = 0; // Variable to detect the start-up
 
void setup() 
{
  // Initialize serial at 9600 baudrate:
  Serial.begin(115200);
  // Set the input digital pins
  pinMode(INPUT_1, INPUT);
  pinMode(INPUT_2, INPUT);
  pinMode(INPUT_3, INPUT);
  // Set the output digital pins
  pinMode(OUTPUT_1, OUTPUT);
  pinMode(OUTPUT_2, OUTPUT);
  pinMode(OUTPUT_3, OUTPUT);
} 
 
void loop() 
{ 

  if (initialized == 0)
  {
    Serial.println("Arduino 3 has been initialized.");
    digitalWrite(OUTPUT_1, LOW);
    digitalWrite(OUTPUT_2, LOW);
    digitalWrite(OUTPUT_3, LOW);
  } else {
    Serial.println("One second has passed since the previous transmission.");
    Serial.print("The counter value is: ");
    Serial.println(seconds_counter);
    if (digitalRead(INPUT_1) == HIGH) {
      Serial.println("Discrete input 1 is at high level.");
    } else {
      Serial.println("Discrete input 1 is at low level.");
    }
    if (digitalRead(INPUT_2) == HIGH) {
      Serial.println("Discrete input 2 is at high level.");
    } else {
      Serial.println("Discrete input 2 is at low level.");
    }
    if (digitalRead(INPUT_3) == HIGH) {
      Serial.println("Discrete input 3 is at high level.");
    } else {
      Serial.println("Discrete input 3 is at low level.");
    }
  }

  initialized = 1;

  switch (seconds_counter) {
      case 0:
        digitalWrite(OUTPUT_1, LOW);
        digitalWrite(OUTPUT_2, LOW);
        digitalWrite(OUTPUT_3, LOW);
        break;
      case 1:
        digitalWrite(OUTPUT_1, HIGH);
        break;
      case 2:
        digitalWrite(OUTPUT_2, HIGH);
        break;
      case 3:
        digitalWrite(OUTPUT_3, HIGH);
        break;
      default:
        digitalWrite(OUTPUT_1, LOW);
        digitalWrite(OUTPUT_2, LOW);
        digitalWrite(OUTPUT_3, LOW);
    }

  delay(1000);

  if (seconds_counter == 3) {
    seconds_counter = 0;
  } else {
    seconds_counter++;
  }

} 

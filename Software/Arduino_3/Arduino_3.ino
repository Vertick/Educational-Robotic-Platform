/**************************************************************************************************/
/* File name: Arduino 3                                                                           */
/**************************************************************************************************/
/* Author name: Pedro Plaza                                                                       */
/**************************************************************************************************/
/* Initial version 1 - 09/12/2017                                                                 */
/**************************************************************************************************/

#include <Servo.h> 
 
Servo PWM_1;
Servo PWM_2;
Servo PWM_3;
Servo PWM_4;
Servo PWM_5;
Servo PWM_6;

const int INPUT_1 =  2;// INPUT_1 set to D2 pin
const int INPUT_2 =  4;// INPUT_2 set to D4 pin
const int INPUT_3 =  7;// INPUT_3 set to D7 pin
const int OUTPUT_1 =  8;// OUTPUT_1 set to D8 pin
const int OUTPUT_2 =  12;// OUTPUT_2 set to D12 pin
const int OUTPUT_3 =  13;// OUTPUT_3 set to D13 pin

const int ARDUINO_ID = 3;// Arduino identifier
const int SERVO_OFFSET = 30;// Offset for servo rotation angle
const int SERVO_STEP = 5;// Step for servo rotation angle
int initialized = 0; // Variable to detect the start-up
int seconds_counter = 0; // Variable to detect the start-up
 
void setup() 
{
  // Initialize serial at 9600 baudrate:
  Serial.begin(115200);
  // Initialize PWM ports
  PWM_1.attach(3, 771, 1798);
  PWM_2.attach(5, 771, 1798);
  PWM_3.attach(6, 771, 1798);
  PWM_4.attach(9, 771, 1798);
  PWM_5.attach(10, 771, 1798);
  PWM_6.attach(11, 771, 1798);
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

  PWM_1.write((ARDUINO_ID)*SERVO_OFFSET+SERVO_STEP*seconds_counter+1);
  PWM_2.write((ARDUINO_ID)*SERVO_OFFSET+SERVO_STEP*seconds_counter+2);
  PWM_3.write((ARDUINO_ID)*SERVO_OFFSET+SERVO_STEP*seconds_counter+3);
  PWM_4.write((ARDUINO_ID)*SERVO_OFFSET+SERVO_STEP*seconds_counter+4);
  PWM_5.write((ARDUINO_ID)*SERVO_OFFSET+SERVO_STEP*seconds_counter+5);
  PWM_6.write((ARDUINO_ID)*SERVO_OFFSET+SERVO_STEP*seconds_counter+6);

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


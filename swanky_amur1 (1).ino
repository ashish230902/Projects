 int counter=0;
 int reading;

void setup()
{
  pinMode(9, OUTPUT);
  pinMode(8, INPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
      

 Serial.begin(9600);
  int counter =0;
}

void loop()
{ 
  
  reading = digitalRead(8);
  if(reading==HIGH)
  {
    counter++;
    delay(100);
    Serial.print(counter);
  }
   if(counter ==3)
    {digitalWrite(5,LOW);
     digitalWrite(4,LOW);
     digitalWrite(3,LOW);
          delay(1000);
     
     digitalWrite(5,LOW);
     digitalWrite(4,LOW);
     digitalWrite(3,HIGH);
          delay(1000);

     
     digitalWrite(5,LOW);
     digitalWrite(4,HIGH);
     digitalWrite(3,LOW);
          delay(1000);

     
     digitalWrite(5,LOW);
     digitalWrite(4,HIGH);
     digitalWrite(3,HIGH);
          delay(1000);

     
     digitalWrite(5,HIGH);
     digitalWrite(4,LOW);
     digitalWrite(3,LOW);
          delay(1000);

     
     digitalWrite(5,HIGH);
     digitalWrite(4,LOW);
     digitalWrite(3,HIGH);
          delay(1000);

     
     digitalWrite(5,HIGH);
     digitalWrite(4,HIGH);
     digitalWrite(3,LOW);
          delay(1000);

     
     digitalWrite(5,HIGH);
     digitalWrite(4,HIGH);
     digitalWrite(3,HIGH);
          delay(1000);
    }     
      
 if(counter == 1)
 {
   for(int i =0;i<255; i=i+10)
   {
     analogWrite(9,i);
     delay(100);
   }
   for(int j=255; j>0; j=j-10)
   {
     analogWrite(9,j);
     delay(100);
   }
 }
    
    if(counter ==2)
  {
   
      analogWrite(9, 255);
      delay(1000);
      analogWrite(9,0);
      delay(1000);
    
  }
    
}
 


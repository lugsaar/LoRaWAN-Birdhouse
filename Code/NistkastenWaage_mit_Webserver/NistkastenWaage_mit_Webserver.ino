/****************************************
lugsaar.de
Nistkastenwaage mit Webseite
Scale in a bird nesting case with webpage
*****************************************/

#include <ESP8266WiFi.h>
#include "HX711.h"

// Scale
HX711 scale;
uint8_t dataPin = 16;
uint8_t clockPin = 4;

// Network secrets
const char* ssid = "xxxx";
const char* password = "xxxx";

// Web Server
WiFiServer server(80);


void setup() {
  
  //setting up the scale
  scale.begin(dataPin, clockPin);
  scale.set_scale(1010.748468);       // Values taken from separate calibration
  scale.set_offset(4294856092);
  scale.tare(0);
  
  // Initializing serial port
  Serial.begin(115200);
  delay(1000);

  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("WiFi connected to ");
  Serial.println(ssid);
  
  // Starting the web server
  server.begin();
  Serial.print("Nestbox web server is running under IP ");
  Serial.println(WiFi.localIP());
  Serial.println("lugsaar.de");
  Serial.println("");
  delay(5000);
}


void loop() {

  //getting the weight
  if (scale.is_ready())
  {
  // Serial.println(scale.get_units(1));
  }

  // Listenning for new clients
  WiFiClient client = server.available();
  
  if (client) {
    Serial.println("New client");
    // to locate when the http request ends
    boolean blank_line = true;
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        
        if (c == '\n' && blank_line) {
            float nestweight = scale.get_units(1);
            
            if (isnan(nestweight) ) {
              Serial.println("Failed to read from scale sensor!");
              }
              
            else{
              Serial.print("Weight: ");
              Serial.print(nestweight);
              Serial.println(" Gramm: ");
              }
                          
            client.println("HTTP/1.1 200 OK");
            client.println("Content-Type: text/html");
            client.println("Connection: close");
            client.println();
            // web page to displays nesting weight
            client.println("<!DOCTYPE HTML>");
            client.println("<html>");
            client.println("<head></head><body><h1>Nistkasten Waage</h1><h3>Gewicht auf der Waage ");
            client.println(nestweight);
            client.println(" Gramm</h3><h3>lugsaar.de");
            client.println("</h3><h3>");
            client.println("</body></html>");     
            break;
        }
        if (c == '\n') {
          // starts reading a new line
          blank_line = true;
        }
        else if (c != '\r') {
          // character on the current line
          blank_line = false;
        }
      }
    }  
    // closing the client connection
    delay(1);
    client.stop();
    Serial.println("Client disconnected.");
    Serial.println("");
  }
}   

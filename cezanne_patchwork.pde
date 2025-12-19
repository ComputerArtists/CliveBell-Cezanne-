// Cézanne’s Farbflächen – Patchwork-Technik
// Processing 3.x / 4.x – sofort lauffähig

int gridSize = 20;                // Anzahl Felder pro Richtung (20×20 = 400 Flächen)
float cellSize;
int mode = 0;                     // 0 = Rechtecke, 1 = Ellipsen, 2 = Mischung

float timeOffset = 0;

void setup() {
  size(800, 800);
  noStroke();
  cellSize = width / (float)gridSize;
  
  // Cézanne-Farbpalette (gedämpfte, erdige Töne)
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(210, 20, 90); // sanfter bläulich-grauer Grund

  // Maus horizontal → Geschwindigkeit der Farbverschiebung
  float shiftSpeed = map(X, 0, width, 0.001, 0.02);
  
  // Maus vertikal → Größe der Flächen (Zellen-Offset)
  float sizeFactor = map(mouseY, 0, height, 0, 1.1);
  
  timeOffset += shiftSpeed;

  for (int y = 0; y < gridSize; y++) {
    for (int x = 0; x < gridSize; x++) {
      
      // Position
      float px = x * cellSize + cellSize/2;
      float py = y * cellSize + cellSize/2;
      
      // Größe mit MausY-Modulation
      float w = cellSize * sizeFactor;
      float h = cellSize * sizeFactor;
      
      // Cézanne-typische Farben mit Perlin-Noise + Zeitverschiebung
      float n = noise(x * 0.1, y * 0.1, timeOffset);
      float hue = map(n, 0, 1, 180, 280); // Blau-Violett-Grün-Bereich
      float sat = map(n, 0, 1, 40, 70);
      float bri = map(n, 0, 1, 50, 85);
      
      // Leichte Variation pro Zelle
      hue = (hue + x + y * 0.5) % 360;
      
      fill(hue, sat, bri);
      
      // Form je nach Modus
      if (mode == 0) {
        rect(px - w/2, py - h/2, w, h);
      } else if (mode == 1) {
        ellipse(px, py, w, h);
      } else { // Mischung
        if ((x + y) % 2 == 0) {
          rect(px - w/2, py - h/2, w, h);
        } else {
          ellipse(px, py, w, h);
        }
      }
    }
  }

  // Hilfetext
  fill(255, 220);
  textAlign(CENTER);
  text("Maus X → Geschwindigkeit der Farbverschiebung", width/2, 30);
  text("Maus Y → Größe der Flächen", width/2, 60);
  text("Taste '1' → Rechtecke", width/2, 100);
  text("Taste '2' → Ellipsen", width/2, 130);
  text("Taste '3' → Mischung", width/2, 160);
  text("Taste 's' → Bild speichern", width/2, 200);
  text("Aktueller Modus: " + (mode == 0 ? "Rechtecke" : mode == 1 ? "Ellipsen" : "Mischung"), width/2, 250);
}

void keyPressed() {
  if (key == '1') mode = 0;
  if (key == '2') mode = 1;
  if (key == '3') mode = 2;
  
  // Speichern
  if (key == 's' || key == 'S') {
    saveFrame("cezanne_patchwork_####.png");
    println("Bild gespeichert!");
  }
}

// Multiple Perspektiven – Mont Sainte-Victoire mit Perlin-Noise & Zerfall
// Korrigierte Version – Processing 3.x / 4.x – sofort lauffähig

float angle = 0;
int viewCount = 4;
float noiseScale = 0.01;
float noiseTime = 0;

float collapseFactor = 0; // 0 = normal, 1 = komplett zerfallen
boolean collapsing = false;

void setup() {
  size(900, 600, P3D);
  noStroke();
  rectMode(CENTER);
  sphereDetail(8);
}

void draw() {
  background(220, 230, 240);

  lights();
  directionalLight(255, 255, 200, 0.5, 0.5, -1);
  ambientLight(80, 50, 50);

  float alphaBase = map(mouseX, 0, width, 0, 255);
  collapseFactor = map(mouseY, 0, height, 0, 3);
  if (collapsing) collapseFactor = min(collapseFactor + 0.02, 1);

  angle += 0.3;
  noiseTime += 0.005;

  for (int i = 0; i < viewCount; i++) {
    pushMatrix();
    translate(width/2, height/2);

    rotateY(radians(i * 30 + angle * 0.2));
    rotateX(radians(10 * sin(frameCount * 0.01 + i)));

    int alpha = int(alphaBase + i * 20) % 140;

    // Jetzt mit viewIndex = i übergeben
    fill(140, 160, 120, alpha);
    drawFormen(0, -50, 0, i);

    fill(180, 140, 100, alpha);
    drawFormen(60, -30, 0, i);

    fill(100, 120, 180, alpha);
    drawFormen(-60, -40, 0, i);

    fill(200, 180, 140, alpha);
    drawFormen(0, 0, 0, i);

    popMatrix();
  }

  fill(255);
  textAlign(CENTER);
  text("Maus horizontal → Gewichtung der Perspektiven", width/2, 30);
  text("Maus vertikal → Zerfall-Intensität (Perlin-Noise)", width/2, 50);
  text("Taste 'c' → Zerfall starten / stoppen", width/2, 80);
  text("Taste 'r' → Reset", width/2, 110);
}

void drawFormen(float x, float y, float z, int viewIndex) {
  pushMatrix();
  translate(x, y, z);

  pushMatrix();
  translate(0, 0, 0);
  applyNoiseAndCollapse(180, 180, 180, viewIndex);
  box(180);
  popMatrix();

  pushMatrix();
  translate(0, -100, 0);
  applyNoiseAndCollapse(100, 180, 100, viewIndex);
  cone(100, 180);
  popMatrix();

  pushMatrix();
  translate(120, 50, 0);
  applyNoiseAndCollapse(40, 160, 40, viewIndex);
  cylinder(40, 160);
  popMatrix();

  pushMatrix();
  translate(-200, 0, 0);
  applyNoiseAndCollapse(80, 80, 80, viewIndex);
  box(80);
  popMatrix();

  popMatrix();
}

// Noise + Collapse – jetzt mit viewIndex für unterschiedliche Noise-Phasen
void applyNoiseAndCollapse(float w, float h, float d, int viewIndex) {
  float n = noise((frameCount + viewIndex * 100) * noiseScale, noiseTime);
  float collapse = collapseFactor * (n - 0.5) * 2;

  translate(collapse * 20, collapse * 30, collapse * 20);

  if (collapseFactor > 0.7) {
    scale(1 + collapse * 0.5, 1 + collapse * 0.8, 1 + collapse * 0.3);
  }
}

// Hilfsfunktionen Kegel & Zylinder (unverändert)
void cone(float r, float h) {
  beginShape(TRIANGLE_FAN);
  vertex(0, -h/2, 0);
  for (int i = 0; i <= 24; i++) {
    float a = TWO_PI * i / 24.0;
    vertex(cos(a) * r, h/2, sin(a) * r);
  }
  endShape();
}

void cylinder(float r, float h) {
  beginShape(QUAD_STRIP);
  for (int i = 0; i <= 24; i++) {
    float a = TWO_PI * i / 24.0;
    float cx = cos(a) * r;
    float cy = sin(a) * r;
    vertex(cx, -h/2, cy);
    vertex(cx,  h/2, cy);
  }
  endShape();

  beginShape();
  for (int i = 0; i <= 24; i++) {
    float a = TWO_PI * i / 24.0;
    vertex(cos(a) * r, -h/2, sin(a) * r);
  }
  endShape();

  beginShape();
  for (int i = 0; i <= 24; i++) {
    float a = TWO_PI * i / 24.0;
    vertex(cos(a) * r, h/2, sin(a) * r);
  }
  endShape();
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    collapsing = !collapsing;
    if (!collapsing) collapseFactor = 0;
  }
  if (key == 'r' || key == 'R') {
    collapseFactor = 0;
    collapsing = false;
    angle = 0;
    noiseTime = 0;
  }
  
  // NEU: Speichern bei Taste 's'
  if (key == 's' || key == 'S') {
    saveFrame("cezanne_multiple_perspectives_####.png");
    println("Bild gespeichert!");
  }
}

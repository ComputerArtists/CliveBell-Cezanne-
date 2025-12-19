# Cézanne Inspired Generative Art

Zwei Processing-Skripte, die die Malweise von Paul Cézanne auf unterschiedliche Weise in generative, animierte Kunst übersetzen. Beide Werke sind vollständig lauffähig in Processing 3/4/5 und benötigen keine zusätzlichen Bibliotheken.

## Die zwei Skripte

### 1. Cézanne Perspektive mit Entfaltung (`cezanne_unfolded.pde`)

Ein digitales Stillleben aus einfachen 3D-Primitiven (Spheres, Boxes, Cylinders), das Cézannes berühmte Mehrfachperspektive nachahmt.

Die Szene zeigt ein klassisches Motiv: Äpfel und Birnen, eine Flasche/Vase, einen Teller und eine Tischplatte mit gefalteter Decke. Statt einer festen Perspektive „entfaltet“ sich die Komposition langsam über die Zeit – Kamera und Objekte verschieben sich sanft in unterschiedliche Blickwinkel (von oben, seitlich, frontal). Dadurch entsteht der typische Cézanne-Effekt, bei dem der Tisch gleichzeitig aus mehreren Richtungen sichtbar scheint.

Die Oberflächen wirken pastos durch Noise-basierte Texturen oder Vertex-Displacement, die Farben bleiben in der warmen, erdigen Cézanne-Palette. Das Ergebnis ist eine meditative 3D-Animation, die analytische Konstruktion mit lebendiger Bewegung verbindet.

### 2. Cézanne Patchwork / Gitter-Struktur (`cezanne_patchwork.pde`)

Eine abstrakte Hommage an Cézannes späte „constructive stroke“-Technik – die Bildfläche wird in lauter kleine Farbflächen (patches) zerlegt.

Das gesamte Bild ist ein feines Gitter (standardmäßig 20×20 Zellen). Jede Zelle wird mit Rechtecken, Ellipsen oder einer Mischung aus beidem gefüllt. Die Formen sind leicht skaliert und zentriert, die Farben stammen aus einer gedämpften, cézannesken Palette (HSB-Modus mit Perlin-Noise für organische Variation).

Über die Zeit wandern die Farben sanft durch Noise-Offset – das Bild „atmet“ und vibriert. Interaktiv steuerbar:
- Maus X → Geschwindigkeit der Farbverschiebung
- Maus Y → Größe der Flächen
- Tasten 1/2/3 → Modus Rechtecke / Ellipsen / Mischung

Das Ergebnis ist eine beruhigende, mosaikartige Animation, die an Cézannes facettenreiche Pinselstriche erinnert.

## Installation & Start

1. Processing herunterladen: https://processing.org/download
2. Repository klonen oder die beiden `.pde`-Dateien herunterladen
3. In der Processing IDE die gewünschte Datei öffnen
4. Play drücken – los geht’s!

## Steuerung

### Gemeinsam
- `s` → Aktuellen Frame als PNG speichern

### cezanne_patchwork.pde (zusätzlich)
- Maus X → Animationsgeschwindigkeit
- Maus Y → Größe der Flächen
- `1` → Nur Rechtecke
- `2` → Nur Ellipsen
- `3` → Mischung (Schachbrett)

### cezanne_unfolded.pde
(je nach Version: typischerweise Zeit-basierte Animation ohne weitere Interaktion – erweiterbar auf Wunsch)

## Anpassung

Beide Skripte haben wichtige Parameter ganz oben zum einfachen Ändern:

**cezanne_patchwork.pde**
```java
int gridSize = 20;     // Gitterauflösung (mehr = feiner)
int mode = 0;          // Startmodus (0/1/2)

# Cézanne Inspired Generative Art

Zwei generative Kunstwerke in **Processing**, inspiriert von Paul Cézanne: Die Skripte übersetzen seine charakteristische Malweise – pastose Pinselstriche, multiple Perspektiven, konstruktive Formauflösung und vibrierende Farben – in animierten, algorithmischen Code.

## Die zwei Skripte

### 1. Cézanne Perspektive mit Entfaltung (`cezanne_unfolded.pde`)
Ein klassisches Stillleben (Äpfel, Birnen, Tisch, Flasche), das Cézannes berühmte Mehrfachperspektive nachahmt.  
- Objekte werden gleichzeitig aus mehreren Blickwinkeln dargestellt (oben, vorne, seitlich)  
- Langsame „Entfaltung“ über die Zeit – die Perspektiven verschieben sich sanft, als würde man um den Tisch herumgehen  
- Pastose, kantige Pinselstriche mit Noise und Rotation  
- Farben „atmen“ leicht durch subtile Helligkeits- und Sättigungsänderungen  

### 2. Cézanne Gitter-Struktur (`cezanne_grid.pde`)
Eine geometrische Dekonstruktion eines Stilllebens:  
- Das Bild wird in ein Gitter aus kleinen Flächen zerlegt  
- Jede Zelle erhält individuelle pastose Striche und Farbtöne  
- Farben und Licht wandern langsam über das Gitter  
- Leichte Verzerrungen verhindern sterile Perfektion  
- Meditative, fast kubistische Wirkung

<grok-card data-id="1db1c7" data-type="image_card"></grok-card>



<grok-card data-id="c866e6" data-type="image_card"></grok-card>


## Features (gemeinsam)
- Authentische Cézanne-Palette (erdige Rottöne, Grün, Blau, Ocker, Violett)
- Kurze, überlagernde Pinselstriche für pastosen Ölfarbe-Look
- Sanfte Animation mit Perlin-Noise
- Vollständig anpassbare Parameter
- Export-Funktion für Bilder und Videos

## Installation & Start
1. Processing herunterladen: https://processing.org/download
2. Repository klonen oder herunterladen
3. Die gewünschte `.pde`-Datei in der Processing IDE öffnen
4. Play drücken – fertig!

## Steuerung (in beiden Skripten)
| Taste/Maus          | Funktion                              |
|---------------------|---------------------------------------|
| `Space`             | Neues Farbschema generieren           |
| `R`                 | Reset / Neustart                      |
| `S`                 | Aktuellen Frame als PNG speichern     |
| `V`                 | Videoaufzeichnung starten/stoppen     |
| `Mausklick`         | (Grid-Version) Klick auf Zelle für lokale Veränderung |
| `+/-`               | Animationsgeschwindigkeit ändern      |

## Anpassung
Wichtige Parameter stehen ganz oben in jeder Datei:

```java
color[] palette = {...};       // Cézanne-Farbpalette
float brushSize = 12;          // Strichgröße
int gridSize = 30;             // Nur Grid-Version: Gitterauflösung
float unfoldSpeed = 0.0005;    // Nur Unfolded: Geschwindigkeit der Entfaltung

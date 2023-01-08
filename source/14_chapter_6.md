<!--
# Umsetzung

## Implementierung der Datenverarbeitung 

Das Grokk Pattern x Strukturiert unsere Logs und erstellt dafür Felder 
Die Datenverarbeitung besteht aus Drei Schritten: Konvertierung der Datei, Indexieren der Daten und Anwendung der Runtimefields. Die Konvertierung bearbeitet die Datei und bereitet sie für die Indexierung vor, die Indexierung 

Vor der Indexierung werden die Daten mit einem Grok pattern auf ein definiertes Mapping gemappt und verarbeitet. 
Bei der Indexierung bestimmt ein Mapping wie die Datei und die darin enthaltenen Felder gespeichert und Indexiert werden. Die Daten werden mit ein Grok Pattern Gemappt und Indexiert. <!-- Zur Indexierung werden die Daten über eine Grokpattern ausgewertet und über ein Mapping den Feldern zugewiesen ein def  Das Mapping bestimmt wie die Datei und die darin enthaltenen Felder gespeichert und Indexiert werden. --

Die Runtimefields extrahieren aus den Feldern die gewünschten Werte. 

```{caption="Mapping Vorlage der Daten" label=map .numberLines}
  "properties": {
    "@timestamp": { "type": "date" },
    "log.level": { "type": "keyword" },
    "message": { "type": "wildcard" },
    "class": { "type": "text" }
```

In der Auflistung \ref{map} Zeile 1 wird mit dem Mapping Parameter "properties"  begonnen unsere Felder zu definieren. Anschließend wird in Zeile 2 das Feld "@timestamp" mit dem Felddatentyp "date" erstellt. 
Anschließend erstellen die Zeilen 2 bis 4 die Felder timestamp, log.level und message. Jedes Feld wird dabei einen Felddatentyp oder Feldtyp zugewiesen. Der typ gibt die Art der Daten an, die das Feld enthält.
Die Daten werden nun mittels eines Grok patterns auf unsere Felder gemappt und Indexiert. 


 Die Indexierung der Daten 

Zur Indexierung der Daten wird ein Standard Grokpattern für Logs verwendet siehe +. 

Grok ist ein Dialekt für reguläre Ausdrücke, es verwendet die Oniguruma Bibliothek womit alle regulären Ausdrücke akzeptiert werden[@el3]. Grok erlaubt bestehende Muster zu benennen und durch Kombination komplexere Muster zu erstellen welche den gewollten Feldern entsprechen. 
   Das Pattern ermittelt pro Zeile drei Felder, den Zeitstempel, das Loglevel und die Nachricht der Logzeile. Auf der durch die Indexierung erzeugten Dataview 
Unsere Datenverarbeitung besteht aus Drei Schritten: Einlesen der Daten, Indexieren der Daten und Anwendung der Runtimefields.
Zum einlesen der Daten übergibt 

<!-- 
Erster Schritt Nehmen die Log Datei und Indexieren die Daten mit einem Standard Grok Pattern welches Standard Log Schematha erkennt. Timestamp, Loglevel und Message können damit immer verarbeitet werden.
Auf den Indexierten Logs führen wir Runtimefields aus um die Felder wie Prozess name und zugehörige Zeit zu ermitteln. Zur extraktion der Werte die in den Feldern liegen verwenden wir im  Runtimefield ein Script mit einem Grokpattern. 
>
## Einleitung
~~~~{#map .numberLines  caption="Auflistung"}
Das ist die Einleitung. Sed vulputate tortor at nisl blandit interdum. Cras sagittis massa ex, quis eleifend purus condimentum congue. Maecenas tristique, justo vitae efficitur mollis, mi nulla varius elit, in consequat ligula nulla ut augue. Phasellus diam sapien, placerat sit amet tempor non, lobortis tempus ante.

## Methode

Donec imperdiet, lectus vestibulum sagittis tempus, turpis dolor euismod justo, vel tempus neque libero sit amet tortor. Nam cursus commodo tincidunt.

### Unterabschnitt 1

Das ist der erste Teil der Methodik. Duis tempor sapien sed tellus ultrices blandit. Sed porta mauris tortor, eu vulputate arcu dapibus ac. Curabitur sodales at felis efficitur sollicitudin. Quisque at neque sollicitudin, mollis arcu vitae, faucibus tellus.

### Unterabschnitt 2

Das ist der zweite Teil der Methodik. Sed ut ipsum ultrices, interdum ipsum vel, lobortis diam. Curabitur sit amet massa quis tortor molestie dapibus a at libero. Mauris mollis magna quis ante vulputate consequat. Integer leo turpis, suscipit ac venenatis pellentesque, efficitur non sem. Pellentesque eget vulputate turpis. Etiam id nibh at elit fermentum interdum.

<!--
Kommentare können so hinzugefügt werden.


## Ergebnisse

Das sind die Ergebnisse. In vitae odio at libero elementum fermentum vel iaculis enim. Nullam finibus sapien in congue condimentum. Curabitur et ligula et ipsum mollis fringilla.

## Auseinandersetzung

Das ist die Auseinandersetzung mit den Ergebnissen. Curabitur gravida nisl id gravida congue. Duis est nisi, sagittis eget accumsan ullamcorper, semper quis turpis. Mauris ultricies diam metus, sollicitudin ultricies turpis lobortis vitae. Ut egestas vehicula enim, porta molestie neque consectetur placerat. Integer iaculis sapien dolor, non porta nibh condimentum ut.

## Schlussfolgerung

Das ist die Schlussfolgerung des Kapitels. Nulla sed condimentum lectus. Duis sed tempor erat, at cursus lacus. Nam vitae tempus arcu, id vestibulum sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
-->
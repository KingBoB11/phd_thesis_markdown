# Konzept und Implementierung der Arbeit

Um Leistungsprobleme mobiler Anwendungen erkennen und beheben zu können, soll die Leistung grafisch visualisiert werden. Dazu sollen Ladezeiten von Prozesse und Anfragen aus den Logdaten der Anwendung extrahiert und in form von Grafen aufbereitet werden. Zur Realisierung werden die Logdaten mithilfe der Open-Source Software Elasticsearch strukturiert, indexiert und anschließend die Leistungsdaten extrahiert. Für die Visualisierung werden die Daten mit Kibana  in einem Dashboard als Graph aufbereitet. Im Rahmen dieser Arbeit werden für die Implementierung Logdaten der Anwendung Gemo verwendet.
<!--
Es soll ein Prozess erstellt werden um Leistungsdaten aus Logdaten einer Anwendung zur extrahieren und mithilfe von Graphen zu visualisieren. Dadurch soll die Erkennung von Leistungsproblemen erleichtert und verbessert werden. Zum testen der Implementierung werden die Logdaten der Anwendung Gemo genutzt. Alle bisher von Geräten hochgeladenen Logs liegen auf dem Internen FTP-Server der Brunata -->

## Datenerfassung 

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/datensatz.jpeg}
\caption{Beispieldatensatz der Speicherung von Geräte Logs auf dem FTP-Server
\label{Beispieldatensatz}}
\end{figure}
Bisher loggt die Anwendung die benötigte Zeit zum Abschließen von Performance relevanten Prozessen. Dazu wird beim Aufruf eines Prozesses eine Stoppuhr gestartet, welche mit Beendigung des Prozesses die verstrichene Zeit im Log dokumentiert. Intern ist festgelegt, dass am Ende des Tages und im Falle eines Geräte oder Anwendung Absturzes die Logs des Gerätes automatisch auf den internen FTP-Server der Brunata geladen werden. Wie Abbildung \ref{Beispieldatensatz} darstellt, wird ein eingegangener Satz an Logdaten unter dem Gerätenamen sowie die Logs untergeordnet unter dem Anwendungsnamen abgespeichert. In der Implementierung werden diese Logdaten zur Auswertung verwendet.


## Datenvorverarbeitung 

Zur Strukturierung der Logdaten wird die Mapping Vorlage in Auflistung \ref{map} verwendet. 

```{caption="Mapping Vorlage der Daten" label=map .numberLines}
  "properties": {
    "@timestamp": { "type": "date" },
    "log.level": { "type": "keyword" },
    "message": { "type": "wildcard" },
    "class": { "type": "text"}
```

Die Mapping Vorlage definiert die vier Felder, timestamp, loglevel, message, und class die Indexiert werden. Die Datentypen der Felder richten sich dabei nach dem Inhalt den sie halten werden. Der Datentyp "date" steht dabei für ein Zeitformat oder Datum Format das Individuell festgelegt werden kann. "keyword" wird für strukturierten Inhalt wie IDs, E-Mail Adressen oder Status Codes verwendet. "wildcard" ist für unstrukturierten Maschinen generierten Inhalt, er ist optimiert für Felder mit großen Werten oder hoher Kardinalität.[@el5] "text" ist für normalen Volltext Inhalt[@el4]. Der Datentyp bestimmt zusätzlich, ob und wie Felder weiterverarbeitet werden können. 

Das Grok Pattern in Auflistung \ref{grok} Matched das Schema einer Logzeile und bestimmt die Inhalte der definierten Felder die Indexiert werden. 

```{caption="Grok Pattern zur Strukturierung der Daten" label=grok .numberLines}
%{TIMESTAMP_ISO8601:timestamp} %{DATA:class} .?*\[%{LOGLEVEL:loglevel}\] %{GREEDYDATA:message} 
```
Zum Testen wird das Pattern im Grok Debugger verwendet um wie in Abbildung \ref{grok2} dargestellt, eine Test Logzeile zu Strukturieren.
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/grok.jpeg}
\caption{Ausschnitt aus dem Grok Debugger. Veranschaulicht das Grok Pattern und die Strukturierten Daten.}
\label{grok2}
\end{figure}

Das Ergebnis, die Logzeile wird erfolgreich in die vier Felder unterteilt und eignet sich zur Strukturierung der Logs. 

Wie in Abbildung \ref{imp} veranschaulicht, wird das Mapping und das Grok Pattern verwendet, vor der Indexierung der Daten. Dabei wird direkt auf den Indexierten Daten eine Data View für Kibana erstellt. 
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/imp.jpeg}
\caption{Ausschnitt aus der Importirrung und Indexierung einer Logdatei in Elasticsearch}
\label{imp}
\end{figure}

## Datenextraktion 

Die benötigte Zeit von Prozessen und Anfragen sind nach der Vorverarbeitung und Indexierung im Feld "message" enthalten. Um die benötigte Zeit aus dem Feld zu extrahieren, wird ein Runtimefield erzeugt.
Das Runtimefield zur Extraktion der Benötigten zeit bekommt den Namen "duration" und den Datentyp "Double". Zur vereinfachten Nutzung im weiteren Verlauf wird dem Runtimefield ein lable mit seinem Namen zugewiesen.
Zur Extraktion der zeit wird ein Skript in der Elasticsearch Skriptsprache Painless Language verwendet. 

```{caption="Script zur Extraktion der benötigten Zeit" label=dr  .numberLines}
  String duration=grok('%{DATA:typ} took.*? %{NUMBER:duration}').extract(doc["message"].value)?.duration;
    if (duration != null) emit(Integer.parseInt(duration));
```

ein Grok Pattern auf das Feld "message" angewendet welches den Aufbau matched. Nach dem nicht jedes "message" Feld die benötigte Zeit enthält wird im Skript überprüft ob der Wert des Grok Patterns null entspricht.
In der Auflistung \ref{dr} Zeile 1 wird ein Grok Pattern auf das Feld "message" angewendet. Das Pattern matched dabei das in [Aktueller Stand](#aktueller-stand) angesprochene Schema der Ereignis Beschreibung für die benötigte Zeit von Prozessen und Anfragen. Es Strukturiert dabei die Daten in die Felder "typ" und "duration". Der Wert des Feldes "duration" wird extrahiert und in die Variable 'duration' gespeichert. Anschließend wird in Zeile 2 überprüft, ob die Variable 'duration' nicht null ist, und wenn das der Fall ist, wird durch Umwandlung der Variable der integer wert davon zurückgegeben.

Um eine Zuweisung der benötigten Zeit zum Prozess oder der Anfrage erstellen zu können wird ein weiteres Runtimefield für den Typ erstellt. Das Runtimefield erhält den Namen "typ", den Datentyp "Keyword" und das Lable "typ". 


```{caption="Script zur Extraktion des Namens der Anfrage oder des Prozesses" label=sc  .numberLines}
  String typ=grok('%{DATA:typ} took %{NUMBER:duration}').extract(doc["message"].value)?.typ;
    if (typ != null) emit(typ);
```

Das Script in Auflistung \ref{sc} Funktioniert genauso wie das vorangegangene Skript nur auf dem Feld "typ" und ohne Umwandlung der Variable im Falle einer Erfolgreichen Prüfung auf null.

## Visualisierung 

In Dashboards werden die extrahierten Daten in Paneelen Individuell Grafisch aufbereitet. Dazu gibt es in Kibana wie Abbildung \ref{typ} zeigt, eine Auswahl an vorlagen in welchen die Daten aufbereitet werden können.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/typ.jpeg}
\caption{Ausschnitt aus dem Dashboard bei der Erstellung einer Visualisierung}
\label{typ}
\end{figure}

Abhängig von der Vorlage kann man die Felder bestimmen welche als Inhalt für Graphen dienen sollen. Zusätzlich ist es möglich wie in Abbildung \ref{logik} filter oder Formeln auf die Werte der Felder anzuwenden.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/logik.jpeg}
\caption{Ausschnitt der Logik für das Paneel zur Darstellung der benötigten Zeit als Balken Diagramm}
\label{logik}
\end{figure}

Im Rahmen dieser Arbeit wurden vier Paneele in einem Dashboard zur Visualisierung der Daten erstellt. Das erste Paneel in Abbildung \ref{gag} verwendet eine Anzeige die in Prozent angibt wie viele Prozesse und Anfragen sich in einem festgelegtem Bereich befinden. Zusätzlich werden nur benötigten Zeiten kleiner gleich 100ms verwendet. Damit werden lange normale Initiale Ladezeiten ausgefiltert und verfälschen so nicht das Ergebniss und die Funktion der Anzeige. Die Anzeige dient dazu einen Überblick zu erhalten wie viele Werte im gewünschten Zielbereich liegen. Damit kann beispielweise der Fortschritt zu einem festgelegtem Ziel überwacht werden. 

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/gagg.jpeg}
\caption{Paneel Ausschnitt aus dem ihm Rahmen dieser Arbeit erstelltem Dashboard}
\label{gag}
\end{figure}

Das zweite Paneel in Abbildung \ref{gag2} dargestellt, zeigt die Veränderung der Median und Maximalen Ladezeit eines gewählten Prozesses oder Anfrage in in einem festgelegtem zeitrahmen an. Damit wird es erleichtert Abweichungen und unerwartete Veränderungen erkennen und behandeln zu können.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/gag.jpeg}
\caption{Paneel Ausschnitt aus dem ihm Rahmen dieser Arbeit erstelltem Dashboard}
\label{gag2}
\end{figure}

Das in Abbildung \ref{balk} dargestellte dritte Paneel, stellt in einem Balken Diagramm die Längsten Maximalen ladezeiten dar. 

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/balk.jpeg}
\caption{Paneel Ausschnitt aus dem ihm Rahmen dieser Arbeit erstelltem Dashboard}
\label{balk}
\end{figure}

Das Letzte Paneel in Abbildung \ref{heat}, nutzt eine Heat Map und hebt die längsten drei Prozesse mit einer benötigten Zeit großer als 100ms farblich hervor.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/heat.jpeg}
\caption{Paneel Ausschnitt aus dem ihm Rahmen dieser Arbeit erstelltem Dashboard}
\label{heat}
\end{figure}

Das erstellte Dashboard kann auf alle Zukünftig Indexierten Logdaten, welche die verwendeten Felder "typ" und "duration" enthalten, angewendet werden.

<!--
Das Kästchen "Structured Data" in der Abbildung \ref{grok} zeigt wie das im Kästchen darüber stehende Grokpattern die Logzeile auswertet und Strukturiert. 
Die Abbildung \ref{grok} veranschaulicht wie das Grokpattern die Logzeile Strukturiert. Dabei steht in "Sample Data" eine beispielzeile aus einer Logdatei. Das Grokpattern              
Zur vorverarbeitung der Daten bietet Elasticsearch die Möglichkeit, die Daten mit einem Grokpattern zu Strukturieren und in Felder zur Indexierung zu unterteilen. Grok ist ein Dialekt für reguläre Ausdrücke, es verwendet die Oniguruma Bibliothek womit alle regulären Ausdrücke akzeptiert werden[@el3]. Grok erlaubt bestehende Muster zu benennen und durch Kombination komplexere Muster zu erstellen welche den gewollten Feldern entsprechen. Ein Mapping bestimmt wie die Datentypen der Felder und ihre Indexierung.


### Unterabschnitt 2

Das ist der zweite Teil der Methodik. Sed ut ipsum ultrices, interdum ipsum vel, lobortis diam. Curabitur sit amet massa quis tortor molestie dapibus a at libero. Mauris mollis magna quis ante vulputate consequat. Integer leo turpis, suscipit ac venenatis pellentesque, efficitur non sem. Pellentesque eget vulputate turpis. Etiam id nibh at elit fermentum interdum.

<!--
Kommentare können so hinzugefügt werden.
--

## Ergebnisse

Das sind die Ergebnisse. In vitae odio at libero elementum fermentum vel iaculis enim. Nullam finibus sapien in congue condimentum. Curabitur et ligula et ipsum mollis fringilla.

## Auseinandersetzung

Abbildung \ref{mein_label} zeigt wie man eine Abbildung einfügen kann. Donec ut lacinia nibh. Nam tincidunt augue et tristique cursus. Vestibulum sagittis odio nisl, a malesuada turpis blandit quis. Cras ultrices metus tempor laoreet sodales. Nam molestie ipsum ac imperdiet laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.

<!--
Bilder können mit der folgenden Syntax eingefügt werden:
![Bildunterschrift \label{mein_label}](source/figures/beispielbild.jpg){ width=50% }

Details zu den Attributen wie width und height gibt es unter:
http://pandoc.org/MANUAL.html#extension-link_attributes
--

![In den Medien werden für Hacker häufig Symbolbilder wie dieses verwendet. Foto: [pixabay.com](https://pixabay.com/photo-2883632/), Nutzer: [geralt](https://pixabay.com/de/users/geralt-9301/) Lizenz: [Creative Commons CC0](https://creativecommons.org/publicdomain/zero/1.0/deed.de) \label{mein_label}](source/figures/beispielbild.jpg){ width=100% }

## Schlussfolgerung

Das ist die Schlussfolgerung des Kapitels. Quisque nec purus a quam consectetur volutpat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In lorem justo, convallis quis lacinia eget, laoreet eu metus. Fusce blandit tellus tellus. Curabitur nec cursus odio. Quisque tristique eros nulla, vitae finibus lorem aliquam quis. Interdum et malesuada fames ac ante ipsum primis in faucibus.-->

# Konzept und Implementierung der Arbeit

Um Leistungsprobleme mobiler Anwendungen erkennen und beheben zu können, soll die Leistung grafisch visualisiert und evaluiert werden. Dazu sollen Ladezeiten von Prozesse und Anfragen aus den Logdaten der Anwendung extrahiert werden. Zur Realisierung werden die Logdaten mithilfe der Open-Source Software Elasticsearch strukturiert, indexiert und anschließend die Leistungsdaten extrahiert. Für die Visualisierung werden die Daten mithilfe von Kibana in Form von Graphen aufgearbeitet und als Dashboard zur Verfügung gestellt. Im Rahmen dieser Arbeit werden für die Implementierung Logdaten der Anwendung Gemo verwendet.
<!--
Es soll ein Prozess erstellt werden um Leistungsdaten aus Logdaten einer Anwendung zur extrahieren und mithilfe von Graphen zu visualisieren. Dadurch soll die Erkennung von Leistungsproblemen erleichtert und verbessert werden. Zum testen der Implementierung werden die Logdaten der Anwendung Gemo genutzt. Alle bisher von Geräten hochgeladenen Logs liegen auf dem Internen FTP-Server der Brunata -->

## Datenerfassung 

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/datensatz.jpeg}
\caption{Beispieldatensatz der Speicherung von Geräte Logs auf dem FTP-Server
\label{Beispieldatensatz}}
\end{figure}
Bisher loggt die Anwendung die benötigte Zeit zum Abschließen von Performance relevanten Prozessen. Dazu wird beim Aufruf eines Prozesses eine Stoppuhr gestartet, welche mit Beendigung des Prozesses die verstrichene Zeit im Log dokumentiert. Intern ist festgelegt, dass am Ende des Tages und im Falle eines Geräte oder Anwendung Absturzes die Logs des Gerätes automatisch auf den internen FTP-Server der Brunata geladen werden.
Jeder eingegangen Satz an Logdaten wird unter dem Gerätenamen sowie die Logs untergeordnet unter dem Anwendungsnamen abgespeichert. Ein Beispiel ist in Abbildung \ref{Beispieldatensatz} zu sehen.

## Datenvorverarbeitung 

Zur Vorverarbeitung werden die Logdaten mit einem Grokpattern in Felder strukturiert. Grok ist ein Dialekt für reguläre Ausdrücke, es verwendet die Oniguruma Bibliothek womit alle regulären Ausdrücke akzeptiert werden[@el3]. Grok erlaubt, bestehende Muster zu benennen und durch Kombination komplexere Muster zu erstellen, welche den gewollten Feldern entsprechen. 
Zur Strukturierung der Logdaten wird folgendes Grokpattern verwendet 
```
%{TIMESTAMP_ISO8601:timestamp} %{DATA:class} .?*\[%{LOGLEVEL:loglevel}\] %{GREEDYDATA:message} 
```
Das Pattern wird dabei auf jede Logzeile angewendet. Abbildung \ref{grok} veranschaulicht die Strukturierung durch das Grokpattern anhand einer Beispiel Auswertung im Grok Debugger.
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/grok.jpeg}
\caption{Ausschnitt aus dem Grok Debugger. Veranschaulicht das Grokpattern und die Strukturierten Daten.}
\label{grok}
\end{figure}
Ein Mapping bestimmt anschließend die Datentypen der Felder. Dazu wird die folgende Mappingvorlage verwendet:
```{caption="Mapping Vorlage der Daten" label=map .numberLines}
  "properties": {
    "@timestamp": { "type": "date" },
    "log.level": { "type": "keyword" },
    "message": { "type": "wildcard" },
    "class": { "type": "text"}
```
Die Auflistung \ref{map} zeigt die Zuweisung der Datentypen zu, denn durch das Grokpattern erstellten Feldern. Die Datentypen bestimmen die Eigenschaften der Felder und ihre interne Repräsentation. Der Datentyp "date" steht dabei für ein Zeitformat oder Datum Format. "keyword" wird für strukturierten Inhalt wie IDs, E-Mail Adressen oder Status Codes verwendet. "wildcard" ist für unstrukturierten Maschinen generierten Inhalt, er ist optimiert für Felder mit großen Werten oder hoher Kardinalität.[@el5] "text" ist für normalen Volltext Inhalt[@el4]. Der Datentyp bestimmt zusätzlich, ob und wie Felder weiterverarbeitet werden können.

## Datenextraktion 

Die benötigte Zeit von Prozessen und Anfragen sind nach der Vorverarbeitung im Feld "message" enthalten. Um die benötigte Zeit aus dem Feld zu extrahieren, werden Runtimefields erzeugt.<!-- Die benötigte Zeit von Prozessen und Anfragen stehen in den Feldern "message". Um die benötigte zeit von Prozessen und Anfragen aus den Feldern zu extrahieren die diese Information enthalten werden Runtimefields erstellt. -->Ein Runtimefield dient dazu, zur Laufzeit Ausdrücke aus Feldern zu extrahieren ohne erneute Indexierung[@el1]. Dazu werden Skripte, die Grokpattern zur Auswertung des Feldes verwenden, angewendet. Das Runtimefield zur Extraktion der Benötigten zeit bekommt den Namen "duration" und den Datentyp "Double". Zur vereinfachten Nutzung im weiteren Verlauf wird dem Runtimefield ein lable mit seinem Namen zugewiesen.
```{caption="Script zur Extraktion der benötigten Zeit" label=dr .haskell .numberLines}
  String duration=grok('%{WORD:typ} took %{NUMBER:duration}').extract(doc["message"].value)?.duration;
    if (duration != null) emit(Integer.parseInt(duration));
```
In der Auflistung \ref{dr} Zeile 1 wird ein Grokpattern verwendet, um das Feld "message" nach dem in [Aktueller Stand](#aktueller-stand) angesprochenen Schema auszuwerten und in Felder namens "typ" und "duration" zu strukturieren. Zusätzlich wird der wert des Feldes "duration" extrahieren und in der Variable 'duration' gespeichert. Anschließend wird in Zeile 2 überprüft, ob die Variable 'duration' nicht null ist, und wenn das der Fall ist, wird durch Umwandlung der Variable der integer wert davon zurückgegeben.
 Die Abbildung \ref{rt} veranschaulicht den Erstellungsprozess in Elasticsearch.

## Visualisierung 

Die erstellten Felder werden in Kibana über ein Data View behandelt und verarbeitet. Über die grafische Oberfläche, die Kibana zur Verfügung stellt, werden Graphen auf Basis der Felder erstellt.

----- Hier kommt bild von Dashboards rein Danach erklären wie die aufgebaut sind das wars---- 

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

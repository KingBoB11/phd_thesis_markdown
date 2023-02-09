# Konzept und Implementierung der Arbeit

## Überblick der Ziele 

Um Leistungsprobleme mobiler Anwendungen erkennen und beheben zu können, soll die Leistung grafisch visualisiert werden. Dazu sollen Ladezeiten von Prozesse und Anfragen aus den Logdaten der Anwendung extrahiert und in Form von Grafen aufbereitet werden. Zur Realisierung werden die Logdaten mithilfe der Open-Source Software Elasticsearch strukturiert und indexiert, um anschließend die Leistungsdaten zu extrahieren. Für die Visualisierung werden die Daten mit Kibana in einem Dashboard als Graph aufbereitet. Im Rahmen dieser Arbeit werden für die Implementierung Logdaten der Anwendung Gemo verwendet.

<!--
Es soll ein Prozess erstellt werden um Leistungsdaten aus Logdaten einer Anwendung zur extrahieren und mithilfe von Graphen zu visualisieren. Dadurch soll die Erkennung von Leistungsproblemen erleichtert und verbessert werden. Zum testen der Implementierung werden die Logdaten der Anwendung Gemo genutzt. Alle bisher von Geräten hochgeladenen Logs liegen auf dem Internen FTP-Server der Brunata -->

## Datenerfassung 

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/datensatz.jpeg}
\caption{Beispieldatensatz der Speicherung von Geräte Logs auf dem FTP-Server
\label{Beispieldatensatz}}
\end{figure}
Bisher loggt die Anwendung die zum Abschließen von performancerelevanten Prozessen benötigte Zeit. Dazu wird beim Aufruf eines Prozesses eine Stoppuhr gestartet, die mit Beendigung des Prozesses die verstrichene Zeit im Log dokumentiert. Intern ist festgelegt, dass am Ende des Tages und im Fall eines Geräte- oder Anwendungsabsturzes die Logs des Gerätes automatisch auf den internen FTP-Server der Brunata geladen werden. Wie in Abbildung \ref{Beispieldatensatz} darstellt ist, werden ein eingegangener Satz an Logdaten unter dem Gerätenamen sowie die Logs untergeordnet unter dem Anwendungsnamen abgespeichert. In der Implementierung werden diese Logdaten zur Auswertung verwendet.


## Datenvorverarbeitung 

Zur Strukturierung der Logdaten wird die Mapping-Vorlage aus Abbildung \ref{map} verwendet.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/map.png}
\caption{Mapping-Vorlage der Daten}
\label{map}
\end{figure}

<!--
```{caption="Mapping Vorlage der Daten" label=map .numberLines}
  "properties": {
    "@timestamp": { "type": "date" },
    "log.level": { "type": "keyword" },
    "message": { "type": "wildcard" },
    "class": { "type": "text"}
```
-->

In der Mapping-Vorlage sind die vier Felder timestamp, loglevel, message und class definiert, die indexiert werden. Die Datentypen der Felder sind nach dem Inhalt ausgerichtet, den sie erhalten sollen. Der Datentyp ‚date‘ steht dabei für ein Zeit- oder ein Datumformat, das individuell festgelegt werden kann. Das Feld ‚keyword‘ wird für strukturierten Inhalt wie IDs, E-Mail-Adressen oder Status-Codes verwendet. Bei ‚wildcard‘ handelt es sich um für unstrukturierte Maschinen generierten Inhalt, der optimiert ist für Felder mit großen Werten oder hoher Kardinalität.[@el5] Das Feld ‚text‘ bezieht sich auf herkömmlichen Volltextinhalt[@el4] Der Datentyp bestimmt zusätzlich, ob und wie Felder weiterverarbeitet werden können.

Das Grok-Pattern in Abbildung \ref{grok} entspricht dem Schema einer Logzeile und bestimmt die Inhalte der definierten Felder, die indexiert werden.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/pat.png}
\caption{Grok-Pattern zur Strukturierung der Daten}
\label{grok}
\end{figure}

<!--
```{caption="Grok Pattern zur Strukturierung der Daten" label=grok .numberLines}
%{TIMESTAMP_ISO8601:timestamp} %{DATA:class} .?*\[%{LOGLEVEL:loglevel}\] %{GREEDYDATA:message} 
```
-->

Zum Testen wird das Pattern im Grok-Debugger verwendet, um wie in Abbildung \ref{grok2} einsehbar eine Logzeile zu strukturieren.
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/grok.jpeg}
\caption{Ausschnitt aus dem Grok-Debugger zum Grok-Pattern und zu den strukturierten Daten}
\label{grok2}
\end{figure}

Das Ergebnis, die Logzeile, wird erfolgreich in die vier Felder unterteilt und eignet sich zur Strukturierung der Logs.

Wie in Abbildung \ref{imp} veranschaulicht wird, werden vor der Indexierung der Daten das Mapping und das Grok-Pattern verwendet. Dabei wird direkt auf den indexierten Daten eine Data-View für Kibana erstellt.
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/imp.jpeg}
\caption{Ausschnitt aus der Importirrung und der Indexierung einer Logdatei in Elasticsearch}
\label{imp}
\end{figure}

## Datenextraktion 

Die für das Ausführen von Prozessen und Anfragen benötigte Zeit wird nach der Vorverarbeitung sowie der Indexierung im Feld ‚message‘ angezeigt. Um sie aus dem Feld zu extrahieren, wird ein Runtimefield erzeugt. 
Das Runtimefield zur Extraktion der benötigten Zeit erhält den Namen ‚duration‘ und den Datentyp ‚double‘. Zur vereinfachten Nutzung im weiteren Verlauf wird dem Runtimefield ein Label mit seinem Namen zugewiesen.
Zur Extraktion der Zeit wird ein Skript in der Elasticsearch-Skriptsprache Painless Language verwendet.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/grokc1.png}
\caption{Script zur Extraktion der benötigten Zeit}
\label{dr}
\end{figure}

<!-- 
```{caption="Script zur Extraktion der benötigten Zeit" label=dr  .numberLines}
  String duration=grok('%{DATA:typ} took.*?
        %{NUMBER:duration}')
            .extract(doc["message"].value)?.duration;
    if (duration != null) emit(Integer.parseInt(duration));
```
-->

In Abbildung \ref{dr}, Zeile eins wird ein Grok-Pattern auf das Feld ‚message‘ angewendet. Das Pattern entspricht dabei dem in aktueller Stand angesprochenen Schema der Ereignisbeschreibung für die von Prozessen und Anfragen benötigte Zeit. Es strukturiert die Daten in die Felder ‚typ‘ und ‚duration‘. Der Wert des Feldes ‚duration‘ wird extrahiert und unter der Variablen ‚duration‘ gespeichert. Anschließend wird in Zeile zwei überprüft, ob die Variable ‚duration‘ nicht null entspricht, und wenn das der Fall ist, wird durch Umwandlung der Variable der Integerwert zurückgegeben.

Um eine Zuweisung der benötigten Zeit zum Prozess oder zur Anfrage zu erstellen, wird ein weiteres Runtimefield für den Typ erstellt. Dieses erhält den Namen ‚typ‘, den Datentyp ‚Keyword‘ und das Label ‚typ‘.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/grokc2.png}
\caption{Script zur Extraktion des Namens der Anfrage oder des Prozesses}
\label{sc}
\end{figure}

<!--
```{caption="Script zur Extraktion des Namens der Anfrage oder des Prozesses" label=sc  .numberLines}
  String typ=grok('%{DATA:typ} took %{NUMBER:duration}')
            .extract(doc["message"].value)?.typ;
    if (typ != null) emit(typ);
```
-->

Das Script in Abbildung \ref{sc} funktioniert genauso wie das vorangegangene Skript, nur auf dem Feld ‚typ‘ und ohne Umwandlung der Variablen im Fall einer erfolgreichen Prüfung auf null.

## Visualisierung 

In Dashboards werden die extrahierten Daten in Paneelen individuell grafisch aufbereitet. Dazu steht in Kibana wie in Abbildung \ref{typ} gezeigt eine Auswahl an Vorlagen bereit, in denen die Daten aufbereitet werden können.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/typ.jpeg}
\caption{Ausschnitt aus dem Dashboard bei der Erstellung einer Visualisierung}
\label{typ}
\end{figure}

Abhängig von der Vorlage können die Felder bestimmt werden, die als Inhalt für Graphen dienen sollen. Zusätzlich ist es möglich, wie in Abbildung \ref{logik} Filter oder Formeln auf die Werte der Felder anzuwenden.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/logik.jpeg}
\caption{Ausschnitt der Logik für das Paneel zur Darstellung der benötigten Zeit als Balkendiagramm}
\label{logik}
\end{figure}

Im Rahmen dieser Arbeit wurden vier Paneele in einem Dashboard zur Visualisierung der Daten erstellt. Im ersten Paneel in Abbildung 4.6 wird eine Anzeige verwendet, in der als Prozentzahl angegeben wird, wie viele Prozesse und Anfragen sich in einem festgelegten Bereich befinden. Zusätzlich werden nur benötigte Zeiten kleiner als oder gleich 100 ms verwendet. Damit werden lange normale initiale Ladezeiten ausgefiltert, was nötig ist, um das Ergebnis und die Funktion der Anzeige nicht durch sie zu verfälschen. Die Anzeige dient dazu, einen Überblick dessen zu erhalten, wie viele Werte im gewünschten Zielbereich liegen. Damit kann beispielweise der Fortschritt in Richtung eines festgelegten Ziels überwacht werden.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/gagg.jpeg}
\caption{Paneel-Ausschnitt aus dem im Rahmen dieser Arbeit erstellten Dashboard}
\label{gag}
\end{figure}

Im zweiten Paneel, das in Abbildung \ref{gag2} dargestellt ist, wird die Veränderung der Median und der maximalen Ladezeit eines gewählten Prozesses oder einer Anfrage in einem festgelegtem Zeitrahmen angezeigt. Damit wird es erleichtert, Abweichungen und unerwartete Veränderungen zu erkennen sowie zu behandeln.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/gag.jpeg}
\caption{Paneel-Ausschnitt aus dem im Rahmen dieser Arbeit erstellten Dashboard}
\label{gag2}
\end{figure}

Das in Abbildung \ref{balk} einsehbare dritte Paneel enthält die längste maximale Ladezeit in einem Balkendiagramm.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/balk.jpeg}
\caption{Paneel-Ausschnitt aus dem im Rahmen dieser Arbeit erstellten Dashboard}
\label{balk}
\end{figure}

Im letzten Paneel in Abbildung \ref{heat}wird eine Heat-Map genutzt, um die längsten drei Prozesse mit einer benötigten Zeit größer als 100 ms farblich hervorzuheben.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/heat.jpeg}
\caption{Paneel-Ausschnitt aus dem im Rahmen dieser Arbeit erstellten Dashboard}
\label{heat}
\end{figure}

Das erstellte Dashboard kann auf alle zukünftig indexierten Logdaten angewendet werden, die die verwendeten Felder ‚typ‘ und ‚duration‘ umfassen.

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

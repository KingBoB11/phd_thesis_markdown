# Bewertung der Ergebnisse


Der im Rahmen dieser Bachelorarbeit entstandene Analyseprozess diente dem Ziel, aus den Logdaten der Anwendungen die von Prozessen und Anfragen benötigte Zeit zu extrahieren und aufzubereiten. Damit sollte die aktuelle Problembehandlung von Leistungsproblemen vereinfacht bzw. verbessert werden. Zusätzlich sollten unerkannte Leistungsprobleme erkannt und behoben werden. \
In der Implementierung mithilfe von Elasticsearch und Kibana wurde die vom Unternehmen gestellte Anforderung erfüllt, dass die Datenverarbeitung ausschließlich intern geschieht. Die in Kibana anhand mit Elasticsearch extrahierter Daten erstellten Graphen eignen sich dafür, die Ladezeiten auf verschiedene Arten aufzubereiten. Zur Bewertung der Funktionalität der Graphen wurden die Panele mit drei Test-Logdateien geprüft. Diese Logdateien enthalten drei, fünf bzw. acht Leistungsprobleme.

---------------------------------------------------------------------------
Graphen                   Drei                      Fünf                         Acht   
--------------         ------------------------   -----------------------   ----------------------  
Panel 1                     3                            5                         8

Panel 2                     3                            5                         8   

Panel 3                     3                            5                         8

Panel 4                     3                            3                         3

----------------------------------------------------------------------------------------

Table: Ergebnisse zur Anzahl erkannter Leistungsprobleme der Paneele.\label{EvaluationTable}

Die Tests ergaben, dass die grafische Darstellung der medialen und der maximalen benötigten Zeit zum Beheben eines spezifischen Prozesses auf einem Zeitabschnitt betrachtet im zweiten Panel die Untersuchung von gemeldeten Problemen sowie die Erkennung von Leistungsproblemen erleichtert. Des Weiteren bilden das erste und das dritte Panel eine sinnvolle, erfolgsversprechende Erweiterung zur Erkennung von Leistungsproblemen. Das vierte Panel mit der Heat-Map ist aufgrund seiner begrenzten und unübersichtlichen Darstellung nicht für eine große Menge von Leistungsproblemen geeignet. Sein sinnvoller Einsatz ist in Kombination mit dem zweiten Panel allerdings möglich, da somit die erfassten Problemprozesse und -anfragen genauer betrachtet werden können.
<!-- 
# Konzept der Anwendung

## Datenerfassung

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/datensatz.jpeg}
\caption{Beispieldatensatz der Abspeicherung von Geräte Logs auf dem FTP-Server
\label{Beispieldatensatz}}
\end{figure}
Bisher loggt die Anwendung, die benötigte Zeit zum Abschließen von Performance Relevanten Prozessen. Dazu wird beim Aufruf eines Prozesses eine Stoppuhr gestartet, welche mit Beendigung des Prozesses die verstrichene Zeit im Log Dokumentiert. Intern ist festgelegt, dass am ende des Tages und im Falle eines Geräte oder Anwendung Absturzes die Logs des Gerätes automatisch auf den Internen FTP-Server der Brunata geladen werden.
Jeder eingegangen Satz an Log Daten wird unter dem Gerätenamen, sowie die Logs untergeordnet unter dem Anwendungsnamen, abgespeichert. Ein Beispiel ist in Abbildung \ref{Beispieldatensatz} zu sehen. Im Rahmen dieser Arbeit werden nur Logs der Anwendung GEMO betrachtet.

## Datenverarbeitung

Für die Verarbeitung der Logdaten wird Elasticsearch benutzt[@el2]. Es baut auf der Apache Lucene-Bibliothek auf und ermöglicht durch die Verwendung von Runtimefields und Scripting, Felder und Ausdrücke zur Laufzeit ohne erneute Indexierung zu Extrahieren[@el1]. Die Extraktion ohne erneute Indexierung Spart Speicher und erhöht die Verarbeitungsgeschwindigkeit[@el].--

 Die Verarbeitung besteht dabei aus Drei Schritten: Strukturierung der Datei, Indexierung und Anwendung der Runtimefields. Zur Strukturierung wird ein Grokpattern verwendet und mit einem Mapping wird bestimmt wie die Datei und die darin enthaltenen Felder gespeichert und Indexiert werden. Mithilfe von Scripts und Grokpattern in Runtimefields werden der Prozessname und die benötigte Zeit aus unseren Strukturierten und Indexierten Feldern extrahiert.

## Visualisierung der Daten

Für die Graphische Darstellung der Daten wird Kibana verwendet. Dazu wird ein Data View auf den Indexierten Daten erzeugt.
 Kibana Zur Visualisierung wird in Kibana ein Data View erstellt welches auf unsere Indexierten Daten basiert. Zur Graphischen Darstellung wird
Kibana ist eine Open-Source-Visualisierungs- und Analyseplattform, die auf Elasticsearch aufbaut und von der Firma Elastic entwickelt wird. Kibana ermöglicht es die über Elasticsearch verarbeiteten Daten auf vielfältige weise zu Visualisieren.
 Kibana greift dazu in "Data Views" auf einen oder mehrere Elasticsearch Daten ströme, Indices oder benannten index zu. Eine Data View stellt dafür Dashboards zur Verfügung in welchen man die Daten seinen Wünschen entsprechend Graphisch darstellen kann. Die Ausgewerteten Daten werden in einem Dashboard in Form eines Graphen Visualisiert.


## Datenextraktion

Für die Extraktion werden unterschiedliche Runtimefields in Kombination mit Grok Pattern verwendet.
Elasticsearch bietet eine einfache und kostenlose Benutzung der Such und Extrahier Methoden im gegensatz zu
Die Prozesszeiten mit dem Zugehörigen Prozessen aus einem Log werden mithilfe eines Runtimefields in Kombination mit einem Grok Pattern extrahiert.



## Methode

Donec imperdiet, lectus vestibulum sagittis tempus, turpis dolor euismod justo, vel tempus neque libero sit amet tortor. Nam cursus commodo tincidunt.

### Unterabschnitt 1

Das ist der erste Teil der Methodik. Duis tempor sapien sed tellus ultrices blandit. Sed porta mauris tortor, eu vulputate arcu dapibus ac. Curabitur sodales at felis efficitur sollicitudin. Quisque at neque sollicitudin, mollis arcu vitae, faucibus tellus.

### Unterabschnitt 2

Das ist der zweite Teil der Methodik. Sed ut ipsum ultrices, interdum ipsum vel, lobortis diam. Curabitur sit amet massa quis tortor molestie dapibus a at libero. Mauris mollis magna quis ante vulputate consequat. Integer leo turpis, suscipit ac venenatis pellentesque, efficitur non sem. Pellentesque eget vulputate turpis. Etiam id nibh at elit fermentum interdum.

<!--
Kommentare können so hinzugefügt werden.


## Ergebnisse

Die Tabelle \ref{tabellenreferenz} zeigt uns wie man eine Tabelle hinzufügt. Integer tincidunt sed nisl eget pellentesque. Mauris eleifend, nisl non lobortis fringilla, sapien eros aliquet orci, vitae pretium massa neque eu turpis. Pellentesque tincidunt aliquet volutpat. Ut ornare dui id ex sodales laoreet.

<!-- Erzwingt eine neue Seite

\newpage

---------------------------------------------------------------------------
Spalte 1            Spalte 2                Spalte 3
--------------      -------------------     -------------------
Zeile 1               0.1                     0.2

Zeile 2               0.3                     0.3

Zeile 3               0.4                     0.4      

Zeile 4               0.5                     0.6

---------------------------------------------------------------------------

Table: Das ist die Tabellenbeschriftung. Suspendisse blandit dolor sed tellus venenatis, venenatis fringilla turpis pretium. \label{tabellenreferenz}


## Auseinandersetzung

Das ist die Auseinandersetzung mit den Ergebnissen. Etiam sit amet mi eros. Donec vel nisi sed purus gravida fermentum at quis odio. Vestibulum quis nisl sit amet justo maximus molestie. Maecenas vitae arcu erat. Nulla facilisi. Nam pretium mauris eu enim porttitor, a mattis velit dictum. Nulla sit amet ligula non mauris volutpat fermentum quis vitae sapien.

## Schlussfolgerung

Das ist die Schlussfolgerung des Kapitels. Nullam porta tortor id vehicula interdum. Quisque pharetra, neque ut accumsan suscipit, orci orci commodo tortor, ac finibus est turpis eget justo. Cras sodales nibh nec mauris laoreet iaculis. Morbi volutpat orci felis, id condimentum nulla suscipit eu. Fusce in turpis quis ligula tempus scelerisque eget quis odio. Vestibulum et dolor id erat lobortis ullamcorper quis at sem.
-->

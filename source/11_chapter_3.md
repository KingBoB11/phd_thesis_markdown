# Stand der Technik

## Probleme im Status quo

<!--Um die Leistung einer Anwendung zu Evaluieren 
Leistungsdaten aus Logdaten zu extrahieren und zu verarbeiten ist eine bekannte Herausforderung beim Text Mining.-->Performancerelevante Daten zu erheben und zu verarbeiten, bildet eine bekannte Herausforderung bei der Performance-Evaluation. Es gibt viele Lösungsansätze zu den verschiedenen Verfahren des Bereichs. Sie unterscheiden sich im Aufwand der Vorverarbeitung sowie in der Weiterverarbeitung der Daten. Die Schwierigkeit besteht darin, die Leistung genau zu messen, da es eine Vielzahl von Geräten, Netzwerken und Betriebssystemen gibt, die in diesem Rahmen verwendet werden können.

Es hat sich in den letzten Jahren durchgesetzt, mittels Text-Mining Leistungsdaten aus Logs zu extrahieren und grafisch aufzuarbeiten. Die Entwicklung einer solchen Auswertung und Analyse bei beispielweise Datadog[@dataDog],  Dynatrace[@dynatrace] und New Relic[@newRelic] haben zu einem Paradigmenwechsel in der Performance-Evaluation geführt, sodass diese neu für eine Vielzahl von Anwendungen ohne großen Aufwand möglich ist.

Bei Softwarelösungen der führenden Unternehmen wie Datadog ist es notwendig, zur vollumfänglichen Nutzung Daten außerhalb des Betries zu verarbeiten^[vgl. Magic Quadrant im Gartner Report [@gartner] und Dokumentation Datadog [@dataDog]]. Die Softwarelösung des Anbieters Splunk wird mit der Absicherung durch Aflac zum sicheren Umgang der Daten beworben. Aflac ist eines der führenden Unternehmen im Bereich der Absicherung vertraulicher Daten. Die Softwarelösung von Splunk ist wie die führenden Softwarelösungen cloudbasiert und ermöglicht somit eine schnelle Verarbeitung sowie Skalierung. \ 
Die Unternehmensphilosophie der Brunata Metrona, wonach Daten nur intern verarbeitet werden, und die beschriebene Problematik der datenschutzkonformen Datenverarbeitung im [Data Mining](#Data-Mining) führen dazu, dass keine Softwarelösungen mit externer Datenverarbeitung infrage kommt. Wie in Abbildung \ref{elproz} darstellt ist, werden zur Implementierung der Data-Preperation und der Modelling-Phase im Analyseprozess die Open-Source Such- und Analysesoftware Elasticsearch verwendet. Für die Phasen Evaluation und Deployment kommt die Open-Source-Analyse- und Visualisierungsplattform Kibana zur Anwendung. Das Ziel der
Implementierung besteht darin, die von Prozessen und Anfragen benötigte Zeit aus den Logdaten zu extrahieren und in Form von Graphen darzustellen. Dadurch soll es Entwicklern ermöglicht werden, bisher unerkannte Leistungsprobleme zu erkennen und zu beheben.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=1\textheight]{source/figures/elpic.jpeg}
\caption{Prozessdiagramm zu Methoden und Aufbau des Text-Mining mittels Elasticsearch und Kibana (eigene Darstellung in Anlehnung an IBN SPSS Modeler CRISP-DM Guide)}
\label{elproz}
\end{figure} 

## Elasticsearch und Kibana

Bei Elasticsearch handelt es sich um eine verteilte Such- und Analysesoftware, die im Mittelpunkt von Elastic Stack steht. Elasticsearch bietet Such- und Analysefunktionen für  Arten von Daten. Unabhängig davon, ob es sich um strukturierte oder unstrukturierte Text- bzw. numerische oder Geodaten handelt, können diese in Elasticsearch effizient gespeichert und indiziert werden, sodass eine schnelle Suche möglich ist. Elasticsearch bietet Methoden, die über die einfache Datenabfrage hinausgehen und Informationen aggregieren, um Trends und Muster in den Daten erkennen. Die verteilte Natur von Elasticsearch ermöglicht es, den Einsatz dem wachsenden Volumen von Daten und Abfragen anzupassen.[@el6] 

Beim Mapping werden die Felder der Daten definiert, die indiziert werden sollen. Dieser Prozess ist notwendig, um sicherzustellen, dass die Suchmaschine die Daten korrekt analysieren und interpretieren kann. Durch die Bereitstellung von Mapping-Informationen können Benutzer steuern, wie ihre Daten indiziert werden und wie die Suchmaschine diese bei einer Abfrage interpretiert.

Zur Vorbereitung und zur Strukturierung der Daten in die definierten Felder werden sie mit einem Grok-Pattern, das zu ihrem Inhalt passt, extrahiert und verarbeitet. Grok ist ein Dialekt für reguläre Ausdrücke, in dessen Rahmen die Oniguruma Bibliothek verwendet wird, womit alle regulären Ausdrücke akzeptiert werden.[@el3] Grok erlaubt es, bestehende Muster zu benennen und durch ihre Kombination komplexe Muster zu erstellen, die den gewollten Feldern entsprechen.

Mit den indexierten Daten können zur Laufzeit Runtimefields erzeugt werden.
Ein Runtimefield bildet ein Feld, das zur Laufzeit ausgewertet wird. Es dient dazu, Felder ohne erneute Indexierung der Daten hinzuzufügen, den Rückgabewert eines Feldes zu überschreiben oder ein Feld für einen bestimmten Zweck zu definieren, ohne das zugrunde liegende Schema zu verändern.[@el1] Mithilfe von Skripten werden benutzerdefinierte Ausdrücke ausgewertet. Skripte können in Runtimefields eingesetzt werden, um Werte zur Laufzeit aus indexierte Felder mit einem Grok-Pattern zu extrahieren.


Kibana bildet eine Open-Source-Analyse- und Visualisierungsplattform für die Erstellung von interaktiven Dashboards und Grafiken auf Basis von Elasticsearch zur Erforschung sowie zu Visualisierung der Daten. Um hier Elasticsearch-Daten zu verwenden, wird eine Data-View benötigt, die auf einen oder mehr Indizes oder Datenströme verweisen kann.[@kib] In Dashboards können die Daten von einer oder mehreren Data-Views in einer Sammlung von Paneelen grafisch dargestellt werden. Dabei kann der Inhalt der Felder der Elasticsearch-Daten individuell angepasst und aufbereitet werden.[@kib2]

<!--
oder 


AUSBLICK
Durch die Neugewonnenen Einblicke und die Vereinfachte Darstellung der Probleme in der Software kann nun vom Entwickler eine Genauere Analyse des Problems an der Jeweiligen stelle beginnen. Das ist eine Sehr aufwändiger und Komplexer Schritt, um dies zu erleichtern würde es sich anbieten mittels des CPU Profiler eine Erleichterung für den Entwickler zu schaffen. Der CPU Profiler Zeigt genau auf wo welcher Task wie lange im Processablauf gebraucht hat, Der Entwickler kann dann ganz einfach mittels der Grafischen Oberfläche sich durch die Sachen Klicken und das Problem und die Ursache viel Schneller verstehen und endecken und folglich schneller eine Lösung für das Problem finden. Diese erweiterung würde eine Erheblicher verbesserung des Arbeits und Entwicklungs ablauf darstellen und die Qualität der Anwendung signifkant verbessern.

Kibana ist eine Open-Source-Analyse- und Visualisierungsplattform, die es Benutzern ermöglicht, interaktive Dashboards und Grafiken zur Erforschung und Visualisierung von Elasticsearch Daten zu erstellen. Dazu 

Im Analyse Prozess der im vorherigen Kapitel behandelt wurde übernimmt Elasticsearch 

Mit einem kombinierten Einsatz der Methoden und Verfahren von Elasticsearch und Kibana ist es möglich, Leistungsdaten aus Logdaten zu extrahieren und grafisch aufzuarbeiten. Dadurch können Leistungsprobleme identifiziert und behoben werden. 
Die Abbildung \ref{elproz} veranschaulicht, welche aufgaben Elasticsearch und Kibana im Text Mining Prozess übernehmen.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=1\textheight]{source/figures/prozessel.jpeg}
\caption{Prozessdiagramm veranschaulicht Methoden und Aufbau des Text Mining mittels Elasticsearch und Kibana}
\label{elproz}
\end{figure} 

Elasticsearch übernimmt dabei die Vorbereitung der Daten und die Extraktion der Informationen. Kibana stellt die Visualisierung der Daten zur Verfügung. Nachdem Elasticsearch und Kibana Open-Source sind, können diese auf internen Server agieren und bereitgestellt werden.

Elasticsearch ist eine Opensource verteilte Such- und Analysemaschine für alle Arten von Daten. Unabhängig davon, ob es sich um strukturierten oder unstrukturierten Daten handelt, elasticsearch speicher die Daten Effizient und indiziert sie. Elasticsearch bietet neben der reinen Datenabfrage Methoden an um trends und Muster in den Daten zu erkenne.
Elasticsearch basiert auf der Apache Lucene-Bibliothek, die einen invertierten Index verwendet, um Daten zu speichern und schnell darauf zuzugreifen. Elasticsearch ist hoch skalierbar und ermöglicht schnelle und effiziente Suchabfragen.

Bei der Entwicklung einer automatisierten First-Level-Support Schnittstelle, basierend auf maschinellen Lernen, hat die Firma Brunata-Metrona GmbH & Co Kg gute Erfahrungen gemacht. Dabei ging es um die automatische Text Klassifikation von Support Anfragen bei der internen Support Hotline. Aufgrund dieser zufriedenstellenden Arbeit, soll im Rahmen dieser Arbeit erforscht werden, ob die Nutzung von Logs zur Performance Evaluation auch die gewünschten Ergebnisse erreicht.

Das Ziel dieser Arbeit ist es, basierend auf den Logs einer Mobilen Anwendung der Firma eine Performance Evaluation zu entwerfen und durchzuführen, die weiterentwickelt und auf weitere Anwendungen der Firma angewendet werden kann. Durch die technische Errungenschaft im Bereich Volltextsuche und Auswertung, soll erforscht werden, ob diese Auswertungen auch im bereich der Gemo Logs umsetzbar sind. Optimal wäre es, wenn es gelingt, das auftretende Performance Probleme bei der Ablesung oder Montage durch einen Monteur mithilfe von Performance Monitoring zu erkennen.


Hier erläutern große anbieter nehmen wir aber nicht weil Philosphie daten bleiben inhouse und probleme mit leaks. 

gehen darauf ein was elastic ist und macht udn was es in usnerem prozess übernimmt
Bild wie elastic funzt und was es bei uns übernimmt
## Relevante Daten

Um das Ziel der Performance Evaluation zu erreichen, ist die Erhebung relevanter Daten ein notwendiger Schritt. Relevante Daten sind jene, welche Rückschluss auf die Performance der Anwendung geben. Früher dienten zur Evaluation der Computer Performance der Vergleich von CPU Zyklen^[Vgl. Performance Evaluation and Monitoring 1971 S.81 [@perfomance_evaluation]]. Nachdem diese Daten nicht mehr ausreichend sind^[Vgl. ebd./a.a.O. - selbe Quelle, selbe Seite [@perfomance_evaluation]], benötigt man auf das Anwendungsgebiet Spezifizierte. Für die in der Studienarbeit verwendete Anwendung wird die benötigte Zeit für das Abschließen von Prozessen und die Fehlerquote genutzt.
\newpage

## Methode

Es wurde zur Festlegung der Methodik, der Erhebung Laufzeitrelevanter Daten, eine qualitative Analyse der Methoden in Bezug auf Aufwand zum Implementieren, Komplexität und Einfluss auf zusätzlichen Aufwand der durch diese Methode entsteht untersucht.

### Logging

 Hier Kommt das bereits vorhandene Verfahren der Logs rein, ich gehe darauf ein wie sie funktioniert und werte sie aus und Sage was gut und was schlecht ist.
Ein Ansatz ist logging zu Implementieren, welches den Start, das Ende und die benötigte Zeit von Prozessen loggt.
Die Anwendung der Studienarbeit implementiert Logging. Logging, aus dem Englischen sinngemäß übersetzt etwas zu Dokumentieren^[Vgl. Oxford Advanced Learner´s Dictonary 2015 S.917 [@dictonary]], wird in der Informatik zur Dokumentation und verbesserten Nachvollziehbarkeit von Fehlerzuständen und Prozessabläufen verwendet. Logs werden nach einem vom Entwickler Festgelegtem Schema automatisch Generiert. Jede Zeile entspricht einem neuen Ereignis und wird mit weiteren Informationselementen versehen. Einträge erfolgen in Chronologischer Reihenfolge. Die Anwendung Loggt, die benötigte Zeit zum Abschließen von Performance Relevanten Prozessen. Dazu wird beim Aufruf eines Prozesses eine Stoppuhr gestartet, welche mit Beendigung des Prozesses die ermittelte Zeit als Log Dokumentiert (siehe Code Beispiel).
 Ein ansatzt ist mithilfe von Logging in der Anwendung, alle Prozesse und Ereignise mit Zeitstempeln zu dokumentieren. Die Log Datei enthält die zur Performance Evaluation benötigt Daten. Unter einbezug der vorhandenen

```Java
public void start() {
  timeMillisStart = System.currentTimeMillis();
  timeMillisStartLastLap = timeMillisStart;
}

public void start(String message) {
  Log.d(logTag, "Stopwatch measuring started for {}", message);
}

public void stop() {
  stop("Stopwatch measuring");
}

public void stop(String message) {
  Log.d(logTag, "{} took {}ms", message,
   (System.currentTimeMillis() - timeMillisStart));
}
```

### Modul zur Laufzeiterfassung

Eine weiter Herangehensweise ist die Implementierung einer Klasse welche die Erhebung und Speicherung der relevanten Daten übernimmt. Die Klasse stellt eine Schnittstelle bereit, an welcher der beginn und die beendigung eines Prozesses übergeben wird. Die Klasse ermittelt die benötigte Zeit und Speichert die gesammelten Daten. Das Format der Speicherung richtet sich nach der gewählten Methode zur Realisierung der graphischen Darstellung, welche in Kapitel X behandelt wird.

Kommentare können so hinzugefügt werden.

\newpage

## Ergebnisse


---------------------------------------------------------------------------
Methode         Aufwand          Komplexität    Zusätzlicher Aufwand
--------------  ---------------  -------------  ----------------------  
Logging         1                1              3

Modul           3                2              1

---------------------------------------------------------------------------

Table: Zeigt die Methoden zur Erhebung Relevanter Daten und ihre Eignung in Bezug auf Umsetzbarkeit, Komplexität und Zusätzlichen Aufwand. Die zahlen in den Zellen sind die Bewertung zu den einzelnen Kriterien. Die Bewertung unterteilt sich in 3 Kategorien mit entsprechender Zahl. Die "1" steht für gering, die "2" für mittlere und die "3" für hohe Charaktereigenschaft. Steht eine 1 bei der Komplexität bedeutet das eine geringe Komplexität. \label{EvaluationTable}

Die Auswertung der Tabelle ergibt das Logging als Methode einen geringen Aufwand, geringe Komplexität und hohen Zusätzlichen Aufwand aufweist. Wohingegen das Modul einen Hohe Aufwand, mittlere Komplexität und mittleren Zusätzlichen Aufwand aufweist.

## Auseinandersetzung

Der geringe Aufwand zur Implementierung des Loggings liegt darin das in der Anwendung der Studienarbeit bereits Logging im gewünschten umfang Implementiert ist. Daher rührt auch die geringe Komplexität. Selbst ohne bestehendes Logging in gewünschter form benötigt die Implementierung oder Erweiterung durch einer Stoppuhr mit Logging Funktion in Java 13 Zeilen Code. Siehe Codebeispiel oben. Der hohe zusätzliche Aufwand entsteht dadurch das in der Log Datei nicht nur die gewünschten Performance Daten liegen. Dies führt dazu das in einem nächsten schritt die Logs ausgewertet werden müssen.

Der Hohe Aufwand zur Implementierung des Moduls ergibt sich einerseits, dadurch das die Klasse samt Schnittstelle sinnvoll Implementiert werden muss. Zusätzlich muss die Schnittstelle an allen gewünschten Performance relevanten Prozessen angesprochen werden. Nachdem die Klasse eine Schnittstelle bereitstellt, sich um die Berechnung der benötigten Zeit und der Speicherung kümmert, ist das ganze von mittlerer Komplexität. Der geringe zusätzliche Aufwand rührt durch die selbst Bestimmung der form der Abspeicherung. Diese kann so gewählt werden das die Daten direkt Graphisch ausgewertet werden können.

## Schlussfolgerung

Schlussendlich überwiegen die Vorteile von Logging gegenüber dem großen zusätzlichen Aufwand, sodass in der Studienarbeit Logging und nicht ein eigenes Modul zur Erhebung Laufzeitrelevanter Daten genutzt wird. Im nächsten Kapitel wird die Methode zur Weiterverarbeitung der Daten Untersucht.
-->

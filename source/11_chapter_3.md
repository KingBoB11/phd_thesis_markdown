# Stand der Technik

<!--Um die Leistung einer Anwendung zu Evaluieren 
Leistungsdaten aus Logdaten zu extrahieren und zu verarbeiten ist eine bekannte Herausforderung beim Text Mining.-->Performance relevante Daten zu erheben und verarbeiten ist eine bekannte Herausforderung bei der Performance Evaluation. Es gibt viele Lösungsansätze zu den verschiedenen Verfahren. Sie unterscheiden sich im Aufwand der Vorverarbeitung als auch in der Weiterverarbeitung der Daten. Die Schwierigkeit dabei ist es, die Leistung genau zu messen, da es eine Vielzahl von Geräten, Netzwerken und Betriebssystemen gibt, die verwendet werden.

Es hat sich in den letzten Jahren durchgesetzt, mittels Text Mining Leistungsdaten aus Logs zu extrahieren und grafisch aufzuarbeiten. Die Entwicklung einer solchen Auswertung und Analyse bei beispielweise Datadog[@dataDog],  Dynatrace[@dynatrace] und New Relic[@newRelic] hat zu einem Paradigmenwechsel in der Performance Evaluation geführt, sodass die Performance Evaluation für eine Vielzahl von Anwendungen ohne großen Aufwand möglich ist.

Bei Softwarelösungen der führenden Unternehmen wie Datadog ist es notwendig, zur vollumfänglichen Nutzung Daten außerhalb des Unternehmens zu verarbeiten.^[vgl. Magic Quadrant im Gartner Report [@gartner] und Dokumentation Datadog [@dataDog]]. Die Unternehmensphilosophie, das Daten nur im Unternehmen verarbeitet werden und die in [Data Mining](#Data-Mining) beschriebene Problematik in der datenschutzkonformen Datenverarbeitung führen dazu, das keine Softwarelösungen mit externer Datenverarbeitung infrage kommen. Wie Abbildung \ref{elproz} darstellt, werden zur Implementierung der Data Preperation und Modelling Phase im Analyse Prozess die Open-Source Such- und Analysesoftware Elasticsearch verwendet und. Für die Phasen Evaluation und Deployment wird die Open-Source-Analyse- und Visualisierungsplattform Kibana verwendet. Ziel der Implementierung ist es die benötigte Zeit von Prozessen und Anfragen aus den Logdaten zu Extrahieren und sie in form von Graphen darzustellen. Dadurch soll es Entwicklern ermöglicht werden bisher unerkannte Leistungsprobleme zu erkennen und beheben zu können.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=1\textheight]{source/figures/prozessel.jpeg}
\caption{Prozessdiagramm veranschaulicht Methoden und Aufbau des Text Mining mittels Elasticsearch und Kibana}
\label{elproz}
\end{figure} 

## Elasticsearch und Kibana

Elasticsearch ist eine verteilte Such- und Analysesoftware, die im Mittelpunkt des Elastic Stacks steht. Elasticsearch bietet Such- und Analysefunktionen für verschiedene Arten von Daten. Unabhängig davon, ob es sich um strukturierte oder unstrukturierte Text-, numerische oder Geodaten handelt, kann Elasticsearch diese Daten effizient speichern und indizieren, sodass eine schnelle Suche möglich ist. Elasticsearch bietet Methoden an, die über die einfache Datenabfrage hinausgehen und Informationen aggregieren, um Trends und Muster in den Daten erkennen. Die verteilte Natur von Elasticsearch ermöglicht es, dass sich der Einsatz an das wachsende Volumen von Daten und Abfragen anpasst.[@el6] 

Beim Mapping werden die Felder der Daten, die indiziert werden sollen, definiert. Dieser Prozess ist notwendig, um sicherzustellen, dass die Suchmaschine die Daten richtig analysieren und interpretieren kann. Durch die Bereitstellung von Mapping-Informationen können Benutzer steuern, wie ihre Daten indiziert werden und wie die Suchmaschine die Daten bei einer Abfrage interpretiert. 

Zur Vorbereitung und Strukturierung der Daten in die definierten Felder werden die Daten mit einem Grok Pattern welches auf den Inhalt der Daten passt extrahiert und Verarbeitet. Grok ist ein Dialekt für reguläre Ausdrücke, es verwendet die Oniguruma Bibliothek womit alle regulären Ausdrücke akzeptiert werden[@el3]. Grok erlaubt, bestehende Muster zu benennen und durch Kombination komplexere Muster zu erstellen, welche den gewollten Feldern entsprechen. 

Auf den Indexierten Daten können zur Laufzeit Runtimefields erzeugt werden. Ein Runtimefield ist ein Feld das zur Laufzeit ausgewertet wird. Es dient dazu Felder ohne erneute Indexierung der Daten hinzuzufügen, den Rückgabe wert eines Feldes zu überschreiben oder ein Feld für einen bestimmten Zweck zu definieren ohne das zugrunde liegende Schema zu verändern[@el1]. Mithilfe von Skripten werden benutzerdefinierte Ausdrücke ausgewertet. Skripte können in Runtimefields verwendet werden um zur Laufzeit Werte aus Indexierte Felder mit einem Grok Pattern zu extrahieren.


Kibana ist eine Open-Source-Analyse- und Visualisierungsplattform für die Erstellung von interaktiven Dashboards und Grafiken auf Basis von Elasticsearch zur Erforschung und Visualisierung der Daten. Kibana benötigt eine Data View um Elasticsearch Daten zu verwenden. Dabei kann eine Data View auf einem oder mehr Indizes, Daten Strom oder Index verweisen.[@kib] In Dashboards können die Daten von einer oder mehreren Data Views in einer Sammlung von Paneelen Grafisch dargestellt werden. Dabei kann der Inhalt der Felder der Elasticsearch Daten in Grafen Individuell angepasst und aufbereitet werden.[@kib2]

<!--
oder 


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

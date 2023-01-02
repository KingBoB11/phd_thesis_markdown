# Stand der Technik

Performance Relevante Daten zu Erheben und verarbeiten ist eine bekannte Herausforderung bei der Performance Evaluation. Es gibt viele Lösungsansätze zu den Verschiedenen Verfahren. Sie unterscheiden sich im aufwand der Erhebung als auch in der Weiterverarbeitung der Daten. Die Schwierigkeit dabei ist es, die Leistung genau zu messen, da es eine Vielzahl von Geräten, Netzwerken und Betriebssystemen gibt, die verwendet werden. Außerdem variiert die Leistung einer Mobilen Anwendung je nach Benutzer und Gerät.

Es hat sich in den Letzten Jahren durchgesetzt, die Auswertung von Logs zur Performance Evaluation zu verwenden. Die Entwicklung einer solchen Auswertung und Analyse bei beispielweise datadog APM[] Dynatrace[] und New Relic[] hat zu einem Paradigmenwechsel in der Performance Evaluation geführt, sodass die Performance Evaluation für eine vielzahl von Geräte ohne großen Aufwand möglich ist. 

Bei der Entwicklung einer automatisierten First-Level-Support Schnittstelle, basierend auf maschinellen Lernen, hat die Firma Brunata-Metrona GmbH & Co Kg gute Erfahrungen gemacht. Dabei ging es um die automatische Text Klassifikation von Support Anfragen bei der internen Support Hotline. Aufgrund dieser zufriedenstellenden Arbeit, soll im Rahmen dieser Arbeit erforscht werden, ob die Nutzung von Logs zur Performance Evaluation auch die gewünschten Ergebnisse erreicht.

Das Ziel dieser Arbeit ist es, basierend auf den Logs einer Mobilen Anwendung der Firma eine Performance Evaluation zu entwerfen und durchzuführen, die weiterentwickelt und auf weitere Anwendungen der Firma angewendet werden kann. <!--Durch die technische Errungenschaft im Bereich Volltextsuche und Auswertung, soll erforscht werden, ob diese Auswertungen auch im bereich der Gemo Logs umsetzbar sind.--> Optimal wäre es, wenn es gelingt, das auftretende Performance Probleme bei der Ablesung oder Montage durch einen Monteur mithilfe von Performance Monitoring zu erkennen.

<!--

Hier erläutern große anbieter nehmen wir aber nicht weil Philosphie daten bleiben inhouse und probleme mit leaks. 

gehen darauf ein was elastic ist und macht udn was es in usnerem prozess übernimmt
Bild wie elastic funzt und was es bei uns übernimmt
## Relevante Daten

Um das Ziel der Performance Evaluation zu erreichen, ist die Erhebung relevanter Daten ein notwendiger Schritt. Relevante Daten sind jene, welche Rückschluss auf die Performance der Anwendung geben. Früher dienten zur Evaluation der Computer Performance der Vergleich von CPU Zyklen^[Vgl. Performance Evaluation and Monitoring 1971 S.81 [@perfomance_evaluation]]. Nachdem diese Daten nicht mehr ausreichend sind^[Vgl. ebd./a.a.O. - selbe Quelle, selbe Seite [@perfomance_evaluation]], benötigt man auf das Anwendungsgebiet Spezifizierte. Für die in der Studienarbeit verwendete Anwendung wird die benötigte Zeit für das Abschließen von Prozessen und die Fehlerquote genutzt.
\newpage

## Methode

Es wurde zur Festlegung der Methodik, der Erhebung Laufzeitrelevanter Daten, eine qualitative Analyse der Methoden in Bezug auf Aufwand zum Implementieren, Komplexität und Einfluss auf zusätzlichen Aufwand der durch diese Methode entsteht untersucht.

### Logging

<!-- Hier Kommt das bereits vorhandene Verfahren der Logs rein, ich gehe darauf ein wie sie funktioniert und werte sie aus und Sage was gut und was schlecht ist.
Ein Ansatz ist logging zu Implementieren, welches den Start, das Ende und die benötigte Zeit von Prozessen loggt.
Die Anwendung der Studienarbeit implementiert Logging. Logging, aus dem Englischen sinngemäß übersetzt etwas zu Dokumentieren^[Vgl. Oxford Advanced Learner´s Dictonary 2015 S.917 [@dictonary]], wird in der Informatik zur Dokumentation und verbesserten Nachvollziehbarkeit von Fehlerzuständen und Prozessabläufen verwendet. Logs werden nach einem vom Entwickler Festgelegtem Schema automatisch Generiert. Jede Zeile entspricht einem neuen Ereignis und wird mit weiteren Informationselementen versehen. Einträge erfolgen in Chronologischer Reihenfolge. Die Anwendung Loggt, die benötigte Zeit zum Abschließen von Performance Relevanten Prozessen. Dazu wird beim Aufruf eines Prozesses eine Stoppuhr gestartet, welche mit Beendigung des Prozesses die ermittelte Zeit als Log Dokumentiert (siehe Code Beispiel).
<!-- Ein ansatzt ist mithilfe von Logging in der Anwendung, alle Prozesse und Ereignise mit Zeitstempeln zu dokumentieren. Die Log Datei enthält die zur Performance Evaluation benötigt Daten. Unter einbezug der vorhandenen

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
<!--
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

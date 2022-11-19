#   Methode zur Erhebung Laufzeitrelevanter Daten.

## Relevante Daten

Um das Ziel der Performance Evaluation zu erreichen, ist die Erhebung relevanter Daten ein notwendiger Schritt. Relevante Daten sind jene, welche Rückschluss auf die Performance der Anwendung geben. Früher dienten zur Evaluation der Computer Performance der Vergleich von CPU Zyklen^[Vgl. Performance Evaluation and Monitoring 1971 S.81]. Nachdem diese Daten nicht mehr aussreichend sind^[Vgl. ebd./a.a.O. - selbe Quelle, selbe Seite], benötigt man auf das Anwedungsgebiet Spezifizierte. Für die in der Studienarbeit verwendete Anwendung wird die benötigte Zeit für das Abschließen von Prozessen und die Fehlerquote genutzt.
\newpage

## Methode

Es wurde zur Festlegung der Methodik, der Erhebung Laufzeitrelevanter Daten, eine qualitaive Analyse der Methoden in Bezug auf Umsetzbarkeit, Komplexität und Einfluss auf zusätzlichen Aufwand untersucht.

### Logging

<!-- Hier Kommt das bereits vorhandene Verfahren der Logs rein, ich gehe darauf ein wie sie funktioniert und werte sie aus und Sage was gut und was schlecht ist.-->
Ein ansatzt ist logging zu Implementieren, welches den Start, das Ende und die benötigte Zeit von Prozessen loggt.
Die Anwendung der Studienarbeit implementiert Logging. Logging, aus dem Englischen sinngemäß übersetzt etwas zu Dokumentieren^[Vgl. Oxford Advanced Learner´s Dictonary 2015 S.917], wird in der Informatik zur Dokumentation und verbesserten Nachvolziehbarkeit von Fehlerzuständen und Prozessabläufen verwendet. Logs werden nach einem vom Entwickler Festgelegtem Schemah automatisch Generiert. Jede Zeile entspricht einem neuen Ereignis und wird mit weiteren Informationselementen versehen. Einträge erfolgen in Chronologischer Reihenfolge. Die Anwendung Loggt, die benötigte Zeit zum Abschließen von Performance Relevanten Prozessen. Dazu wird beim aufruf eines Prozesses eine Stopuhr gestartet, welche mit beendigung des Prozesses die ermittelte Zeit als Log Dokumentiert (siehe Code Beispiel).
<!-- Ein ansatzt ist mithilfe von Logging in der Anwendung, alle Prozesse und Ereignise mit Zeitstempeln zu dokumentieren. Die Log Datei enthält die zur Performance Evaluation benötigt Daten. Unter einbezug der vorhandenen -->

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
  Log.d(logTag, "{} took {}ms", message, (System.currentTimeMillis() - timeMillisStart));
}
```

### Modul zur Laufzeiterfassung

Eine weiter Herangehensweise ist die Implemtierung einer Klasse welche die Erhebung und Speicherung der relevanten Daten übernimmt. Die Klasse stellt eine Schnittstelle bereit, an welcher der beginn und die beendigung eines Prozesses übergeben wird. Die Klasse ermittelt die benötigte Zeit und Speichert die gesammelten Daten. Das format der Speicherung richtet sich nach der gewählten methode zur realisierung der graphischen darstellung, welche in Kapitel X behandelt wird.
<!--
Kommentare können so hinzugefügt werden.
-->
\newpage

## Ergebnisse

\ref{EvaluationTable}

---------------------------------------------------------------------------
Methode         Umsetzbarkeit    Komplexität    Zusätzlicher Aufwand
--------------  ---------------  -------------  ----------------------  
logging         5                1              3

Modul           5                3              2

---------------------------------------------------------------------------

Table: Zeigt die Methoden zur erhebung Relevanter Daten und ihre eignung in bezug auf Umsetzbarkeit, Komplexität und Zusätzlichen Aufwand. Die zahlen in den zellen sind  . \label{EvaluationTable}

Das sind die Ergebnisse. Ut accumsan tempus aliquam. Sed massa ex, egestas non libero id, imperdiet scelerisque augue. Duis rutrum ultrices arcu et ultricies. Proin vel elit eu magna mattis vehicula. Sed ex erat, fringilla vel feugiat ut, fringilla non diam.

## Auseinandersetzung

Das ist die Auseinandersetzung mit den Ergebnissen. Duis ultrices tempor sem vitae convallis. Pellentesque lobortis risus ac nisi varius bibendum. Phasellus volutpat aliquam varius. Mauris vitae neque quis libero volutpat finibus. Nunc diam metus, imperdiet vitae leo sed, varius posuere orci.

## Schlussfolgerung

Das ist die Schlussfolgerung des Kapitels. Praesent bibendum urna orci, a venenatis tellus venenatis at. Etiam ornare, est sed lacinia elementum, lectus diam tempor leo, sit amet elementum ex elit id ex. Ut ac viverra turpis. Quisque in nisl auctor, ornare dui ac, consequat tellus.

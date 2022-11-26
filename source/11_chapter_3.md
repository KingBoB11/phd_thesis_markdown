# Erhebung Laufzeitrelevanter Daten.

## Relevante Daten

Um das Ziel der Performance Evaluation zu erreichen, ist die Erhebung relevanter Daten ein notwendiger Schritt. Relevante Daten sind jene, welche Rückschluss auf die Performance der Anwendung geben. Früher dienten zur Evaluation der Computer Performance der Vergleich von CPU Zyklen^[Vgl. Performance Evaluation and Monitoring 1971 S.81]. Nachdem diese Daten nicht mehr aussreichend sind^[Vgl. ebd./a.a.O. - selbe Quelle, selbe Seite], benötigt man auf das Anwedungsgebiet Spezifizierte. Für die in der Studienarbeit verwendete Anwendung wird die benötigte Zeit für das Abschließen von Prozessen und die Fehlerquote genutzt.
\newpage

## Methode

Es wurde zur Festlegung der Methodik, der Erhebung Laufzeitrelevanter Daten, eine qualitaive Analyse der Methoden in Bezug auf Aufwand zum Implementieren, Komplexität und Einfluss auf zusätzlichen Aufwand der durch diese Methode entsteht untersucht.

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
  Log.d(logTag, "{} took {}ms", message,
   (System.currentTimeMillis() - timeMillisStart));
}
```

### Modul zur Laufzeiterfassung

Eine weiter Herangehensweise ist die Implemtierung einer Klasse welche die Erhebung und Speicherung der relevanten Daten übernimmt. Die Klasse stellt eine Schnittstelle bereit, an welcher der beginn und die beendigung eines Prozesses übergeben wird. Die Klasse ermittelt die benötigte Zeit und Speichert die gesammelten Daten. Das format der Speicherung richtet sich nach der gewählten methode zur realisierung der graphischen darstellung, welche in Kapitel X behandelt wird.
<!--
Kommentare können so hinzugefügt werden.
-->
\newpage

## Ergebnisse


---------------------------------------------------------------------------
Methode         Aufwand          Komplexität    Zusätzlicher Aufwand
--------------  ---------------  -------------  ----------------------  
logging         1                1              3

Modul           3                2              1

---------------------------------------------------------------------------

Table: Zeigt die Methoden zur erhebung Relevanter Daten und ihre eignung in bezug auf Umsetzbarkeit, Komplexität und Zusätzlichen Aufwand. Die zahlen in den zellen sind die bewertung zu den einzelnen Kriterien. Die bewertung unterteilt sich in 3 Kategorien mit entsprechender Zahl. Die "1" steht für gering, die "2" für mittlere und die "3" für hohe Characktereigenschaft. Steht eine 1 bei der Komplexität bedeutet das eine geringe Komplexität. \label{EvaluationTable}

Die auswertung der Tabelle ergibt das Logging als Methode einen geringen Aufwand, geringe Komplexität und hohen Zusätzlichen Aufwand aufweist. Wohingegen das Modul einen Hohe Aufwand, mittlere Komplexität und mittleren Zusätzlichen Aufwand aufweist.

## Auseinandersetzung

Der geringe Aufwand zur Implementierung des Loggings liegt darin das in der Anwendung der Studienarbeit bereits Logging im gewünschten umfang Implementiert ist. Daher rührt auch die geringe Komplexität. Selbst ohne bestehendes Logging in gewünschter form benötigt die Implementierung oder erweitung durch einer Stopuhr mit Logging funktion in Java 13 Zeilen Code. Siehe Codebeispiel oben. Der hohe zusätzliche Aufwand ensteht dadurch das in der Log Datei nicht nur die gewünschten Performance Daten liegen. Dies führt dazu das in einem nächsten schritt die Logs ausgewertet werden müssen.

Der Hohe Aufwand zur Implemtierung des Moduls ergibt sich einerseits, dadurch das die Klasse samt Schnittstelle sinnvoll Implementiert werden muss. Zusätzlich muss die Schnittstelle an allen gewünschten Performance relevanten Prozessen angesprochen werden. Nachdem die Klasse eine Schnittstelle bereitstellt, sich um die berechnung der benötigten Zeit und der Speicherung kümmert, ist das ganze von mittlerer Komplexität. Der geringe zusätzliche Aufwand rührt durch die selbst bestimmung der form der Abspeicherung. Diese kann so gewählt werden das die Daten direkt Graphisch ausgewertet werden können.

## Schlussfolgerung

Schlussendlich überwiegen die Vorteile des Loggings den großen zusätzlichen Aufwand, sodass in der Studienarbeit Logging und nicht ein eigenes Modul zur erhebung Laufzeitrelevanter Daten genutzt wird. Im nächsten Kapitel wird die Methode zur weiterverarbeitung der Daten Untersucht.

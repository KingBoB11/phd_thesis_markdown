# Logging als geigneten Methode zur Erhebung Laufzeitrelevanter Daten.

## Laufzeitrelevante Daten

Um das Ziel der Performance Evaluation zu erreichen, ist ein notwendiger Schritt die Erhebung relevanter Daten. Relevante Daten sind jene, welche Rückschluss auf die Performance der Anwendung geben. Früher dienten zur Evaluation der Computer Performance meist der Vergleich von CPU Zyklen^[Vgl. Performance Evaluation and Monitoring 1971 S.81]. Nachdem diese Daten nicht mehr aussreichend sind^[Vgl. ebd./a.a.O. - selbe Quelle, selbe Seite], benötigt man auf das Anwedungsgebiet Spezifizierte. In diesem Fall wird die benötigte Zeit für das Abschließen von Prozessen und die Fehlerquote genutzt.
\newpage

## Methode

Es wurde zur Festlegung der Methodik, der Erhebung Laufzeitrelevanter Daten, eine qualitaive Analyse aller Eigenschaften der Methoden in Bezug auf Umsetzbarkeit, Komplexität und Einfluss auf zusätzlichen Aufwand untersucht.

### Logging

<!-- Hier Kommt das bereits vorhandene Verfahren der Logs rein, ich gehe darauf ein wie sie funktioniert und werte sie aus und Sage was gut und was schlecht ist.-->
Logging, aus dem Englischen sinngemäß übersetzt etwas zu Dokumentieren^[Vgl. Oxford Advanced Learner´s Dictonary 2015 S.917], wird in der Informatik zur Dokumentation und verbesserten Nachvolziehbarkeit von Fehlerzuständen und Prozessabläufen verwendet. Logs werden nach einem vom Entwickler Festgelegtem Schemah automatisch Generiert. Dabei entspricht jede Zeile einem neuen Ereignis und wird mit weiteren Informationselementen versehen. Einträge erfolgen in Chronologischer Reihenfolge. Ein ansatzt ist mithilfe von Logging in der Anwendung, alle Prozesse und Ereignise mit Zeitstempeln zu dokumentieren. Die Log Datei enthält die zur Performance Evaluation benötigt Daten. Unter einbezug der vorhandenen 

```java
mood = 'happy'
if mood == 'happy':
    print("I am a happy robot")
```

### Schnitstelle

Das ist der zweite Teil der Methodik. Proin tincidunt odio non sem mollis tristique. Fusce pharetra accumsan volutpat. In nec mauris vel orci rutrum dapibus nec ac nibh. Praesent malesuada sagittis nulla, eget commodo mauris ultricies eget. Suspendisse iaculis finibus ligula.

<!--
Kommentare können so hinzugefügt werden.
-->
\newpage

## Ergebnisse

\ref{EvaluationTable}

---------------------------------------------------------------------------
Umsetzbarkeit            Komplexität        zusätzlicher Aufwand
--------------      -------------------     -------------------
Zeile 1               0.1                     0.2

Zeile 2               0.3                     0.3

Zeile 3               0.4                     0.4      

Zeile 4               0.5                     0.6

---------------------------------------------------------------------------

Table:  Eignung der Techniken für die Performance Evaluation. Suspendisse blandit dolor sed tellus venenatis, venenatis fringilla turpis pretium. \label{EvaluationTable}

Das sind die Ergebnisse. Ut accumsan tempus aliquam. Sed massa ex, egestas non libero id, imperdiet scelerisque augue. Duis rutrum ultrices arcu et ultricies. Proin vel elit eu magna mattis vehicula. Sed ex erat, fringilla vel feugiat ut, fringilla non diam.

## Auseinandersetzung

Das ist die Auseinandersetzung mit den Ergebnissen. Duis ultrices tempor sem vitae convallis. Pellentesque lobortis risus ac nisi varius bibendum. Phasellus volutpat aliquam varius. Mauris vitae neque quis libero volutpat finibus. Nunc diam metus, imperdiet vitae leo sed, varius posuere orci.

## Schlussfolgerung

Das ist die Schlussfolgerung des Kapitels. Praesent bibendum urna orci, a venenatis tellus venenatis at. Etiam ornare, est sed lacinia elementum, lectus diam tempor leo, sit amet elementum ex elit id ex. Ut ac viverra turpis. Quisque in nisl auctor, ornare dui ac, consequat tellus.

# Grundlagen

Die Performance Evaluation Mobiler Anwendungen ist der Prozess zur Bewertung der Qualität, Zuverlässigkeit und Leistung einer Mobilen Anwendung, um ihre Eignung für einen bestimmten Zweck zu bestimmen. Dieser Prozess umfasst in der Regel das Sammeln und Analysieren von Metriken wie Reaktionszeit, Speichernutzung, Energieverbrauch und Benutzererfahrung sowie anderer Faktoren. Die Bewertung hilft den Entwicklern, fundierte Entscheidungen über Design und die Funktionalität ihrer Produkte zu treffen, und kann auch dazu verwendet werden, Verbesserungswürdige Bereiche zu ermitteln.[@Dikaiakos2001]
<!--
Das folgende Kapitel schafft die Grundlagen auf der die Umsetzung der Implementierung basiert. Den Anfang bildet dabei die Einführung in die zu Evaluierende Anwendung. Anschließend werden die wichtigsten Bestandteile der Performance Evaluation einer Mobilen Anwendung erläutert und zur weiteren Bearbeitung in der Arbeit in 3 Abschnitte unterteilt.

Ausgangslage bei der Brunata

Bild das Veranschaulicht welche Apps es gibt und KOmunukation


Bild homescreen und funktionen der APP
-->

## Aktuelle Anwendung


<!-- >
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=2\textheight]{source/figures/aufbau.PNG}
\caption{Anwendungs Umfeld und Aufbau bei Brunata}
\label{aufbau}
\end{figure}
Abbildung \ref{aufbau} veranschaulicht die Anwendungen und den Aufbau. --> 
Die Brunata nutzt zur Bündelung der Arbeitsschritte der Mess- und Montagepartner eigens entwickelte Apps. Die Anwendung Gemo bündelt die Funktionen der Anwendugen und ist die Schnittstelle für Mess- und Montage Partner.
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/gemo.jpeg}
\caption{Screenshot aus der Anwendung Gemo}
\label{gemo}
\end{figure}
Wie Abbildung \ref{gemo} veranschaulicht ist es möglich, über die App Termine für die Ablesung von Zählerwerten, sowie der Montage von Geräten zu erstellen. Des Weiteren leitet und Kontrolliert die App den korrekten Ein- und Ausbau der Geräte und stellt sicher, dass Fehler erkannt und behoben werden können. Die gesammelten Daten werden über die Funktion Synchronisieren ins SAP System geladen. Zur geschützten Datenübertragung wird  das mobile Internet mit der VPN-Technologie^[VPN Virtual Private Network, ist ein geschlossenes Netzwerk, welches zum transport privater Daten, ein anderes öffentliches Netzwerk nutzt.[@vpn]] verwendet. Bei der Synchronisation von Daten über einen mobilen Client, werden diese mittels RSA verschlüsselt und in ein text-basiertes Format (XML) in die Middleware übertragen. Die Anwendungsplattform SAP NetWeaver 7.x wird als Middlewarekomponente genutzt. Mit dieser Anwendung können unterschiedliche Geschäftsprozesse auf einer Platform integriert werden.[@netWeaver] Mithilfe der Middleware werden Backenddaten, welche speziell für die Benutzung Mobiler Anwendungen aufbereitet wurden (SAP NetWeaver Mobile), Verwaltet. Die Middleware Komponente dient vor allem der Verteilung von Benutzer- und Geräteverwaltung, sowie Daten- und Softwareaktualisierungen. Die Daten aus der Middleware werden über einen XML-Parser, für die Anbindung an das ERP System (Backend), decodiert.  Mithilfe von RFC^[Remote Function Call: SAP-Schnittstelle, ermöglicht Kommunikation zwischen Systemen und führt Funktionen aus.[@rfc]] führt der Parser bestimmte Funktionen aus und Strukturiert die Daten. Die untenstehende Abbildung veranschaulicht die drei Komponenten und ihre Interaktion miteinander.

![Architekturkomponenten bei Brunata](Z:/Semester_7/Bachelor_Arbeit/phd_thesis_markdown/source/figures/server.png "Architekturkomponenten bei Brunata")

<!--
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{Z:/Semester_7/Bachelor_Arbeit/phd_thesis_markdown/source/figures/server.png}
\caption{Architekturkomponenten bei Brunata}
\end{figure}

Die Brunata stellt ihren Mess- und Montagepartnern die eigens entwickelte App GEMO (**ge**meinsame **Mo**ntagelösung) zur Verfügung. Die Anwendung übernimmt dabei die eine vielzahl von Aufgaben und ist die 
geMo **ge**meinsame **Mo**ntagelösung übernimmt die Aufgabe, die Arbeitsschritte der Mess- und Montagepartner zu bündeln. Dabei ist es möglich, über die App Termine für die Ablesung von Zählerwerten, sowie der Montage von Geräten wie Rauchmeldern, zu erstellen. Des Weiteren leitet und Kontrolliert die App den korrekten Ein- und Ausbau der Geräte und stellt sicher, dass Fehler erkannt und behoben werden können.


## Performance Evaluation

Die Performance Evaluation Mobiler Anwendungen ist der Prozess zur Bewertung der Qualität, Zuverlässigkeit und Leistung einer Mobilen Anwendung, um ihre Eignung für einen bestimmten Zweck zu bestimmen. Dieser Prozess umfasst in der Regel das Sammeln und Analysieren von Metriken wie Reaktionszeit, Speichernutzung, Energieverbrauch und Benutzererfahrung sowie anderer Faktoren. Die Bewertung hilft den Entwicklern, fundierte Entscheidungen über Design und die Funktionalität ihrer Produkte zu treffen, und kann auch dazu verwendet werden, Verbesserungswürdige Bereiche zu ermitteln.[@Dikaiakos2001]
-->

## Aktueller Stand 

Bei der Meldung eines Performanzproblems durch den Monteur werden die Logdaten und die Datenbank des Geräts auf den Internen FTP-Server der Brunata geladen. Das gemeldete Problem wird von einem Entwickler überprüft. Dazu untersucht der Entwickler die hochgeladenen Logdaten des Geräts nach dem Problem. Dabei dient die benötigte Zeit von Prozessen und Anfragen die geloggt wird als Anhaltspunkt für Leistungsprobleme. Die Logdateien umfassen ca 5000 Zeilen und sind nach dem Schema: [Zeitstempel im ISO8601 Format] [Klasse oder Prozess des Aufrufs] [Log Level] [Ereignis Beschreibung] generiert wie der Log ausschnitt in Abbildung \ref{logs} veranschaulicht.
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/logs.PNG}
\caption{Ausschnitt aus einer Logdatei}
\label{logs}
\end{figure} 
<!--
Der Log ausschnitt in Abbildung \ref{logs} zeigt das Schema nach dem die Logs Generiert werden. Das Schema das verwendet wird ist: [Zeitstempel im ISO8601 Format] [Klasse oder Prozess des Aufrufs] [Log Level] [Ereignis Beschreibung]. Die benötigte Zeit von Prozessen wird geloggt und dient als Anhaltspunkt für Leistungsprobleme. Die durch einen Entwickler zu untersuchenden Logs umfassen ca 5000 Zeilen oder mehr. -->

## Analyse der Daten 

Es gibt eine Vielzahl von Analysetechniken die zur Extraktion von Informationen aus Daten eingesetzt werden können. Zu diesen Techniken gehören Regressionsanalyse, Maschinelles Lernen und Data Mining. 

### Regressionsanalyse 

Die Regressionsanalyse ist ein statistisches Verfahren, mit dem Beziehungen zwischen Variablen ermittelt werden kann.[@reg] Die Regressionsanalyse beginnt mit der Festlegung einer abhängigen Variablen, die das Ergebnis oder das Ausgangsergebnis darstellt, das untersucht werden soll. Danach werden eine oder mehrere unabhängige Variablen identifiziert, die Einfluss auf das Ergebnis haben. Die abhängige Variable ist der Faktor, der durch die unabhängigen Variablen beeinflusst wird. 

### Maschinelles Lernen

Maschinelles Lernen ist ein Teilgebiet der künstlichen Intelligenz. Es befasst sich mit Algorithmen welche auf basis von Trainingsdaten automatisiert erwünschtes Verhalten erlernen.[@Maschinelles] Dabei sollte das Prinzip der Generalisierung gewahrt werde. Das bedeutet, ein erstelltes Modell kann auch auf unbekannte Daten das gewünschte Verhalten liefern.

Es wird beim Maschinellen Lernen zwischen verschiedenen Arten unterschieden:

1. Überwachtes Lernen
   
2. Unüberwachtes Lernen

3. Bestärkendes Lernen

Beim überwachtem Lernen wird anhand von klassifizierten Daten ein Modell trainiert, das unbekannte Eingabewerte auf sinnvolle Zielwerte abbildet.[@maschArt] Beim unüberwachten Lernen dagegen werden die Daten nicht klassifiziert. Das Modell soll Strukturen, sogenannte Cluster, in den Daten erkennen. Es gibt dabei kein Zielwert als vorgabe.[@maschArt] Beim bestärkenden Lernen wird das Modell durch ein Belohnungssystem Trainiert. Dazu wird dem Modell durch Belohnung und Bestrafung mitgeteilt, ob seine Entscheidungen korrekt oder falsch waren. Dies hat zur Folge, dass zukünftige Entscheidungen entweder weiterverfolgt oder geändert werden[@Maschinelles] 

### Data Mining

Data Mining (auch als engl. knowledge discovery in databases (KDD) bezeichnet)[@maschArt] ist ein Prozess, um Muster und Strukturen aus Strukturierten Datenbeständen zu extrahieren.[@data] Es gibt verschiedene Modelle um Data Mining Prozesse zu entwickeln.[@data] Ein branchenübergreifende Prozess dafür ist CRISP-DM (CRoss-Industry Standard Process for Data Mining) siehe Abbildung \ref{crisp}.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=1\textheight]{source/figures/crisp.PNG}
\caption{Prozessdiagramm veranschaulicht die Beziehung zwischen den verschiedenen Phasen des CRISP-DM Prozesses. Illustration von Kenneth Jensen, basierend auf IBN SPSS Modeler CRISP-DM Guide [CC BY-SA 3.0 (https://creativecommons.org/licenses/by-sa/3.0)], via Wikimedia Commons}
\label{crisp}
\end{figure} 

Aus der Abbildung \ref{crisp} wird deutlich das es sich nicht um einen Linearen Prozess handelt. Der Prozess unterteilt sich in Sechs Phasen. Die erste Phase das "Business Understanding" konzentriert sich auf die Präzisierung der Problemstellung. Diese bildet die Grundlage für das weiterverfahren im Data Mining Prozess. Eine Auswahl an Relevante Daten, ist nach der Formulierung der Ziele zu treffen. Die Phase lässt sich dabei in Vier Schritte zusammenfassen. Daten sammeln, Daten beschreiben, Untersuchung der Daten und Bewertung der Daten. Die dritte Phase "Daten Preperation" umfasst die notwendige Schritte zur Vorbereitung der Datenmenge zur Analyse in der Modellierung. Hierbei werden die Daten unter anderem Bereinigt und Transformiert. Es können mehrere Modellierungstechniken für eine Problemstellung passen. Die Modellierungstechniken können dabei besondere Anforderungen an die Datenstruktur stellen. Das kann zur Folge haben das zurück in die dritte Phase übergegangen wird um die Daten auf die neuen Anforderungen anzupassen. Die Fünfte Phase "Evaluation" befasst sich mit der Bewertung des Modells. Dabei wird überprüft ob die Zielsetzung mit dem Entwickelten Modell realisiert und Qualitativ abgesichert wird. Lassen sich die Anforderungen nicht erfüllen, wird der Prozess erneut durchlaufen. Die "Deployment" Phase bildet den Abschluss nach erfolgreichem Durchlauf der anderen Phasen und präsentiert in angemessener Form die Ergebnisse dem Benutzer. Abbildung \ref{crisp} zeigt das Beschriebene Konzept im Überblick. 

Es gibt verschiedene Methoden für das Data Mining dazu gehören Clusteranalysen, Bayes-Statistik sowie Maschinelles Lernen.[@data] 
Die Clusteranalyse versucht, aufgrund der zwischen den Objekten vorhandenen Proximität eine gegebene Anzahl von Objekten in Gruppen aufzuteilen oder zu Gruppen zusammenzufassen, wobei sowohl eine herkömmliche als auch eine konzeptuelle Clustermethode angewendet werden kann.[@data] Die Cluster werden so konzipiert, dass die Ähnlichkeit der Objekte innerhalb einer Klasse maximiert und die Ähnlichkeit zwischen Objekten verschiedener Klassen minimiert wird.[@data] Das Bayes-Verfahren beruht auf dem bekannten Theorem von Bayes über bedingte Wahrscheinlichkeiten, welches versucht, die Klassifikation so vorzunehmen, dass die bedingte Wahrscheinlichkeit für die Übereinstimmung der Klassenbildung mit der tatsächlichen Datenstruktur anhand der vorliegenden Daten maximiert wird. [@data] Mithilfe von Maschinellem lernen wird ein Modell Trainiert das ein Objekt aufgrund seiner Attribute in eine vorhandene Klasse einteilt. Techniken dazu wurden im Abschnitt [2.3.2 Maschinelles Lernen](#maschinelles-lernen) behandelt.

Voraussetzung für ein Aussagekräftiges Ergebnis beim Data Mining ist die Qualität der Daten. Fehlerhafte oder unvollständige Daten wirken sich negativ auf das Ergebnis aus. Der Schutz der Daten vor Missbrauch und Diebstahl sowie die einhaltung der geltenden Datenschutzverordnung bei der Verarbeitung sind beim Data Mining zu beachten und eine Herausforderung. 

Text Mining ist ein Teilgebiet von Data Mining. Dabei werden keine Strukturierten Daten sondern unstrukturierte Texte verarbeitet.<!-- Text Mining ist eine Erweiterung von Data Mining wenn es sich bei den behandelten Daten um einen Text handelt.--> Bei der Verarbeitung von Text gibt es einige Besonderheiten im Vergleich zu Strukturierten Daten. Text Mining hat dazu eine Reihe von spezifischen Methoden und Ansätze.[@textMin] Die Methoden setzten sich dabei aus Kombinationen Verwandter Verfahren, Bereiche wie Data Mining, Maschinellem Lernen und natural language processing, zusammen. [@textMin] Das Text Mining wird verwendet zur Extraktion, nicht Triviale Muster oder Inhalte aus unstrukturierten oder Teilweise Strukturieren Texten. Der Prozess für das Text Mining ist ähnlich wie beim Data Mining. Sie unterscheiden sich in in den Verfahren die im Prozess verwendet werden. 

 <!--
 mithilfe der Logs das gemeldete Problem. Falls ein Problem nachgewiesen wird durch den Entwickler behandelt er dieses. 
Über die in Abbildung \ref{logs} zu sehenden Knopf "Logdatein senden" werden die Logdaten des Gerätes auf den Internen FTP-Server der Brunata hochgeladen.


Abbildung \ref{logs} zeigt das Schemah für den aufbau der logs auf.
Die Logs sind dabei nach folgendem Schemah aufgebaut: Zeitstempel im ISO8601 Format des Aufrufs, Klasse oder Prozess des Aufrufs, Loglevel und beschreibung des Ereignis. Ein BeispieIn der Abbildung \ref{logs} ist ein Ausschnitt aus einer Logdatei und das Schemah der logs zu sehen. Ein Log beginnt mit dem 

 Tritt bei der Verwendung einer Mobilen Anwendung der Brunata ein Performanzproblem auf kann der Monteur das Problem Melden. Dabei werden die Logdaten und die Datenbank des Geräts auf den Internen FTP-Server der Brunata hochgeladen. Ein Entwickler untersucht über die gesendete Logdatei das gemeldete Problem.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/logssenden.jpeg}
\caption{Ausschnitt aus der Gemo App zum Hochladen der Geräte Logs}
\label{logs}
\end{figure}
Abbildung \ref{logs} 
 und über die Anwendung die Logs und Datenbank seines Gerätes auf den Internen FTP-Server der Brunata Hochladen. 
kann der Monteuer nach Abschluss der Arbeit das Problem Melden und die Logs und Datenbank seines Geräts auf den internen FTP-Server der Brunata Hochladen

 Gehe darauf ein wie aktuell probleme behandelt wewrden hochladen der Logs und Datanbak in FTP und dann bearbeitung durch einen ENtwickler der das ganze nochmal überprüft und Gggf behandelt 
Aufbau der Logs mit beispiel eines Logs 
danach das Problem das daraus folgt  logs sehr groß und das sollte automatisiert werden 

Danach erkläre verfahren Vorteile und Nachteile und abschließend bewerte sie und entscheide dich für welche wir uns entscheiden DATA Minging


Probleme und Mögliche Angriffe durch weitergavbe von Daten 

Nächster Schritt aufbereitung der Daten erklärung der einzelenen therorie bausteinen

### Datenerfassung

Bei der Bewertung der Leistung einer mobilen Anwendung müssen zunächst Daten gesammelt werden, die zur Messung der Leistung der Anwendung verwendet werden können. Der Prozess der Datenerfassung kann in zwei Hauptkategorien unterteilt werden: direkte Datenerfassung und indirekte Datenerfassung.

Bei der direkten Datenerfassung werden die Daten direkt von der mobilen Anwendung selbst erfasst. Dazu gehören die Messung der Antwortzeit bestimmter Funktionen oder die Messung der Speichernutzung der mobilen Anwendung.

Bei der indirekten Datenerfassung werden Daten aus Quellen gesammelt, die nicht direkt mit der mobilen Anwendung zusammenhängen. Dazu gehören die Sammlung von Daten aus Umfragen zum Benutzerfeedback, Kundenrezensionen oder anderen Quellen.
-->

<!-- >

### Analyse der Daten

Sobald die Daten gesammelt wurden, müssen sie analysiert werden, um die Leistung der mobilen Anwendung zu bewerten. Es gibt eine Vielzahl von Analysetechniken, die zur Bewertung der Leistung einer mobilen Anwendung eingesetzt werden können. Zu diesen Techniken gehören Regressionsanalyse, Maschinelles Lernen und Data Mining.

Die Regressionsanalyse ist ein statistisches Verfahren, mit dem Beziehungen zwischen Variablen ermittelt werden können. Sie kann verwendet werden, um Korrelationen zwischen der Leistung einer mobilen Anwendung und dem Benutzerverhalten zu ermitteln oder um potenzielle Leistungsengpässe zu identifizieren.

Maschinelles Lernen ist eine Art der künstlichen Intelligenz, die Algorithmen verwendet, um Muster und Trends in Daten zu erkennen. Mithilfe des maschinellen Lernens lassen sich Korrelationen zwischen dem Benutzerverhalten und der Leistung einer mobilen Anwendung erkennen oder potenzielle Leistungsprobleme identifizieren.[@maschin],[@Maschinelles]

Data Mining ist ein Prozess, bei dem aussagekräftige Informationen aus großen Datenbeständen extrahiert werden. Mit Data Mining lassen sich Muster und Trends im Benutzerverhalten und in der Leistung mobiler Anwendungen erkennen oder potenzielle Leistungsprobleme identifizieren.[@dataMining]

### Metriken und Verfahren

Es gibt verschiedene Metriken und Verfahren, die zur Bewertung der Leistung einer Mobilen Anwendung verwendet werden können. Früher dienten zur Evaluation der Computer Performance der Vergleich von CPU Zyklen.[@perfomance_evaluation] Die Daten und das Verfahren sind nicht mehr ausreichend, daher benötigt man auf den Verwendungszweck Spezifizierte Metriken und Verfahren.[@perfomance_evaluation] Zu den verschiedenen Verfahren gehören Benchmarken, Performance Monitoring (Anwendung Performance Management APM) und mobile Analyseverfahren. Die Verfahren werden abhängig vom Zweck der Performance Evaluation gewählt.
<!--
Es gibt Drei allgemeine Anwendungsgebiete, die Anwendungsbewertung, die Leistungsprognose und  die Leistungsüberwachung. Bei der Anwendungsbewertung wird die Leistung als Hauptkriterium zur Bewertung und Entscheidungsfindung einer passenden Anwendung herangezogen. Um eine Evaluation durchzuführen muss mindestens ein Prototyp der Anwendung zur Verfügung stehen. Eine Leistungsprognose dient der Unterstützung bei der Neuentwicklung oder Erweiterung einer Anwendung. Das Ziel ist es dabei, die Machbarkeit und Leistung eines Entwurfs vor der endgültigen Entwicklung abzuschätzen. Die Leistungsüberwachung liefert Produktiveleistungsdaten einer Anwendung. Diese Daten können unterstützen um die Auswirkung von Änderungen in der Anwendung zu erkennen und gezielt entstandene Probleme zu beheben.[@perfomance_evaluation]
^[Vgl. Performance Evaluation and Monitoring 1971 S.81 [@perfomance_evaluation]]
^[Vgl. ebd./a.a.O. - selbe Quelle, selbe Seite [@perfomance_evaluation]]
### Ziele einer Evaluation

Bei einer Performance Evaluation wird die Leistung einer Anwendung oder eines Systems gemessen und ausgewertet. Dazu wird ein passendes Formales und produktives Mess- und Evaluationsverfahren ermittelt und angewendet. Die Verfahren sind abhängig von der Anwendung und dem zweck der Performance Evaluation.

Es lassen sich allgemeine drei Ziele für eine Performance Evaluation zusammenfassen: Anwendungsbewertung, Leistungsprognose und Leistungsüberwachung.
<!-- Die Performance Evaluation Mobiler Anwendungen lassen sich auf drei allgemeine Gründe zurückführen: Auswahlbewertung, Leistungsprognose und Leistungsüberwachung. -->

<!--
## Elastic Search

Elasticsearch ist eine Open-Source-Suchmaschine, die auf der Apache Lucene-Bibliothek aufbaut. Sie wurde 2010 von Shay Banon entworfen, entwickelt und 2014 als kommerzielles Produkt veröffentlicht. Es handelt sich um eine verteilte Echtzeit-Such- und Analyse-Engine, die in der Lage ist, strukturierte, halbstrukturierte und unstrukturierte Daten zu speichern, abzurufen und zu verwalten. Das Hauptziel von Elasticsearch ist die Bereitstellung einer verteilten Echtzeit-Such- und Analyseplattform, die schnell, zuverlässig und sicher ist.  

ODER

Elasticsearch ist eine verteilte Open-Source-Suchmaschine, die es den Benutzern ermöglicht, große Datenmengen schnell zu durchsuchen und zu analysieren. Elasticsearch basiert auf der Apache Lucene-Bibliothek, die einen invertierten Index verwendet, um Daten zu speichern und schnell darauf zuzugreifen. Elasticsearch ist hoch skalierbar und ermöglicht schnelle und effiziente Suchabfragen.

### Indizierung

Wenn Daten in Elasticsearch indiziert werden, erstellt die Suchmaschine einen invertierten Index, der die Daten in einer für die Suche optimierten Weise speichert. Dieser Index ist um die Felder der indizierten Dokumente herum strukturiert, was der Suchmaschine eine schnelle Suche und Analyse der Daten ermöglicht. Elasticsearch verwendet außerdem ein dokumentenorientiertes Speichermodell, das eine effiziente Analyse komplexer Daten ermöglicht.

### Mapping

Beim Mapping werden die Felder der Dokumente, die indiziert werden sollen, definiert. Dieser Prozess ist notwendig, um sicherzustellen, dass die Suchmaschine die Daten richtig analysieren und interpretieren kann. Durch die Bereitstellung von Mapping-Informationen können die Benutzer steuern, wie ihre Daten indiziert werden und wie die Suchmaschine die Daten bei einer Abfrage interpretiert.

### Clustering

Elasticsearch bietet Nutzern die Möglichkeit, ihre Daten zu clustern. Clustering kann verwendet werden, um Dokumente mit ähnlichem Inhalt zu gruppieren, um die Fähigkeit der Suchmaschine zu verbessern, relevante Ergebnisse zu finden. Es kann auch verwendet werden, um die Datenmenge zu reduzieren, die indiziert werden muss.[@dataMiningClustering]

### Schlussfolgerung

Elasticsearch ist eine leistungsstarke Open-Source-Suchmaschine, mit der sich große Datenmengen schnell und einfach durchsuchen und analysieren lassen. Elasticsearch eignet sich um Relevante Leistungsdaten aus großen Datensätzen wie Loggs zu filtern und zur weiteren Verarbeitung zur Verfügung stellen.

## Möglichkeiten zur Datenerfassung und Daten Extrahierung

### Logging

Logging, aus dem Englischen sinngemäß übersetzt etwas zu Dokumentieren^[Vgl. Oxford Advanced Learner´s Dictonary 2015 S.917 [@dictonary]], die systematische Aufzeichnung von Ereignissen, Aktivitäten und anderen relevanten Informationen in einer organisierten und strukturierten Weise. Logging in mobilen Anwendungen ist ein Prozess, der relevante Daten über die Leistung oder Nutzung der Anwendung erfasst und aufzeichnet. Es kann verwendet werden, um wichtige Leistungsindikatoren zu verfolgen, Probleme zu beheben, Fehler und Anomalien zu erkennen und sogar Benutzeraktivitäten zu verfolgen. Die Protokollierung ist ein wesentlicher Bestandteil der Entwicklung mobiler Anwendungen, da sie Einblicke in die Leistung der Anwendung bietet und es den Entwicklern ermöglicht, auftretende Probleme schnell zu erkennen und zu beheben.[@logging] Es gibt viele unterschiedliche ebenen des Loggings in Mobilen Anwendungen, die Reihenfolge in Bezug auf die Relevanz, vom geringsten bis zum größten ist "ERROR", "WARN", "INFO", "DEBUG", "VERBOSE".[@android]
Im Rahmen der Arbeit wird Logging zur Erhebung Laufzeitrelevanten Daten verwendet.

### Schnittstelle zur Datenerfassung

Implementierung einer Klasse welche die Erhebung und Speicherung der relevanten Daten übernimmt. Die Klasse stellt eine Schnittstelle mit Methoden bereit, an welcher die vorher Definierten Performance relevanten Daten übergeben werden. Die Klasse verarbeitet und Speichert die Daten. Das Format der Speicherung und Verarbeitung richtet sich nach der gewählten Methode zur Auswertung.

### Volltextsuche

Die Volltextsuche ist ein Verfahren zum Durchsuchen eines Textes oder einer Datei nach bestimmten Wörtern oder Phrasen. Bei der Volltextsuche wird der komplette Text oder die Datei durchsucht, um zu ermitteln, ob ein bestimmtes Wort oder eine bestimmte Phrase vorhanden ist. Im Rahmen der Arbeit wird eine Volltextsuche zur Auswertung der Loggs verwendet.

## Möglichkeiten zur Bewertung der Anwendung

### Performance Monitoring (APM)

APM ist ein Verfahren zur Bewertung der Leistung einer mobilen Anwendung. Es dient der Überwachung, Diagnose und Lösung von Problemen mit der Anwendungsleistung, um ein besseres Benutzererlebnis zu gewährleisten. Es ermöglicht Entwicklern, Probleme schnell und effizient zu identifizieren, zu isolieren und zu beheben. APM wird in der Regel in Kombination mit anderen Tools für die Entwicklung mobiler Anwendungen eingesetzt, z. B. mit Analyse- und Absturzberichten. Dies hilft Entwicklern, wertvolle Einblicke in die Leistung ihrer Anwendung zu gewinnen und Bereiche mit Verbesserungspotenzial zu identifizieren. APM hilft auch dabei, potenzielle Schwachstellen zu erkennen und zu beseitigen, so dass die App schneller und zuverlässiger laufen kann. Durch die Überwachung der App-Leistung können Entwickler Maßnahmen ergreifen, um sicherzustellen, dass die App ein optimales Nutzererlebnis bietet. Im Rahmen der Arbeit wird Performance Monitoring mit einer Graphischen Veranschaulichung verwendet.

### Benchmarken

Benchmarken ist ein Verfahren das zur Bewertung der Leistung einer Mobilen Anwendung eingesetzt wird. Dabei wird die Leistung einer Anwendung mit ähnlichen Anwendungen auf dem Markt verglichen, um die relative Leistung der Anwendung zu ermitteln. In der Regel werden damit die Reaktionsfähigkeit, die Speichernutzung, die Benutzerfreundlichkeit, die Skalierbarkeit und die Sicherheit der Anwendung gemessen. Benchmarken kann auch dazu beitragen, verbesserungswürdige Bereiche zu identifizieren und den Entwicklern zu helfen, Änderungen zur Verbesserung der Anwendungsleistung zu priorisieren. Diese Bewertungsmethode hilft sicherzustellen, dass die Anwendung die Erwartungen der Benutzer erfüllt und auf dem Markt erfolgreich sein kann.

-->
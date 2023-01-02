# Grundlagen

Die Performance Evaluation Mobiler Anwendungen ist der Prozess zur Bewertung der Qualität, Zuverlässigkeit und Leistung einer Mobilen Anwendung, um ihre Eignung für einen bestimmten Zweck zu bestimmen. Dieser Prozess umfasst in der Regel das Sammeln und Analysieren von Metriken wie Reaktionszeit, Speichernutzung, Energieverbrauch und Benutzererfahrung sowie anderer Faktoren. Die Bewertung hilft den Entwicklern, fundierte Entscheidungen über Design und die Funktionalität ihrer Produkte zu treffen, und kann auch dazu verwendet werden, Verbesserungswürdige Bereiche zu ermitteln.[@Dikaiakos2001]
<!--
Das folgende Kapitel schafft die Grundlagen auf der die Umsetzung der Implementierung basiert. Den Anfang bildet dabei die Einführung in die zu Evaluierende Anwendung. Anschließend werden die wichtigsten Bestandteile der Performance Evaluation einer Mobilen Anwendung erläutert und zur weiteren Bearbeitung in der Arbeit in 3 Abschnitte unterteilt.

Ausgangslage bei der Brunata

Bild das Veranschaulicht welche Apps es gibt und KOmunukation


Bild homescreen und funktionen der APP
-->

## Aktuelle Anwendung

Die Brunata nutzt zur Bündelung der Arbeitsschritte der Mess- und Montagepartner die eigens entwickelte App geMo (**ge**meinsame **Mo**ntagelösung). Dabei ist es möglich, über die App Termine für die Ablesung von Zählerwerten, sowie der Montage von Geräten wie Rauchmeldern, zu erstellen. Des Weiteren leitet und Kontrolliert die App den korrekten Ein- und Ausbau der Geräte und stellt sicher, dass Fehler erkannt und behoben werden können. Zur geschützten Datenübertragung wird das mobile Internet mit der VPN-Technologie^[VPN Virtual Private Network, ist ein geschlossenes Netzwerk, welches zum transport privater Daten, ein anderes öffentliches Netzwerk nutzt.[@vpn]] verwendet. Bei der Synchronisation von Daten über einen mobilen Client, werden diese mittels RSA verschlüsselt und in ein text-basiertes Format (XML) in die Middleware übertragen. Die Anwendungsplattform SAP NetWeaver 7.x wird als Middlewarekomponente genutzt. Mit dieser Anwendung können unterschiedliche Geschäftsprozesse auf einer Platform integriert werden.[@netWeaver] Mithilfe der Middleware werden Backenddaten, welche speziell für die Benutzung Mobiler Anwendungen aufbereitet wurden (SAP NetWeaver Mobile), Verwaltet. Die Middleware Komponente dient vor allem der Verteilung von Benutzer- und Geräteverwaltung, sowie Daten- und Softwareaktualisierungen. Die Daten aus der Middleware werden über einen XML-Parser, für die Anbindung an das ERP System (Backend), decodiert.  Mithilfe von RFC^[Remote Function Call: SAP-Schnittstelle, ermöglicht Kommunikation zwischen Systemen und führt Funktionen aus.[@rfc]] führt der Parser bestimmte Funktionen aus und Strukturiert die Daten. Die untenstehende Abbildung veranschaulicht die drei Komponenten und ihre Interaktion miteinander.

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
<!-- Gehe darauf ein wie aktuell probleme behandelt wewrden hochladen der Logs und Datanbak in FTP und dann bearbeitung durch einen ENtwickler der das ganze nochmal überprüft und Gggf behandelt 
Aufbau der Logs mit beispiel eines Logs 
danach das Problem das daraus folgt  logs sehr groß und das sollte automatisiert werden 

Danach erkläre verfahren Vorteile und Nachteile und abschließend bewerte sie und entscheide dich für welche wir uns entscheiden DATA Minging


Probleme und Mögliche Angriffe durch weitergavbe von Daten 

Nächster Schritt aufbereitung der Daten erklärung der einzelenen therorie bausteinen
-->

### Datenerfassung

Bei der Bewertung der Leistung einer mobilen Anwendung müssen zunächst Daten gesammelt werden, die zur Messung der Leistung der Anwendung verwendet werden können. Der Prozess der Datenerfassung kann in zwei Hauptkategorien unterteilt werden: direkte Datenerfassung und indirekte Datenerfassung.

Bei der direkten Datenerfassung werden die Daten direkt von der mobilen Anwendung selbst erfasst. Dazu gehören die Messung der Antwortzeit bestimmter Funktionen oder die Messung der Speichernutzung der mobilen Anwendung.

Bei der indirekten Datenerfassung werden Daten aus Quellen gesammelt, die nicht direkt mit der mobilen Anwendung zusammenhängen. Dazu gehören die Sammlung von Daten aus Umfragen zum Benutzerfeedback, Kundenrezensionen oder anderen Quellen.

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

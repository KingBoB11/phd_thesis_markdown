# Grundlagen

## Form und Zweck der Performance-Evaluation

Die Performance-Evaluation mobiler Anwendungen ist der Prozess der Bewertung ihrer Qualität, Zuverlässigkeit und Leistung mit dem Ziel, ihre Eignung für einen bestimmten Zweck zu bestimmen. Dieser Vorgang umfasst in der Regel das Sammeln und das Analysieren von Metriken wie Reaktionszeit, Speichernutzung, Energieverbrauch und Benutzererfahrung sowie anderen Faktoren. Die Bewertung hilft Entwicklern, fundierte Entscheidungen über Design und Funktionalität ihrer Produkte zu treffen. Sie kann auch dazu verwendet werden, verbesserungswürdige Bereiche zu ermitteln.[@Dikaiakos2001]
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
Bei der Brunata werden zur Steuerung und zur Unterstützung der Arbeitsschritte der Mess- und Montagepartner eigens entwickelte mobile Anwendungen eingesetzt. In der mobilen Anwendung Gemo sind die Funktionen der anderen Anwendungen gebündelt, sie dient als Schnittstelle für Mess- und Montagepartner. Der Aufbau und der Zusammenhang aller firmeninternen Anwendungen werden in Abbildung \ref{anw} veranschaulicht.
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/gerate.png}
\caption{Vereinfachte Darstellung des Zusammenhangs der mobilen Anwendungen der Brunata}
\label{anw}
\end{figure}
In der mobilen Anwendung Gemo werden unter anderem die Funktionen zur Verfügung gestellt,
Termine zum Ablesen von Zählerwerten sowie für die Montage von Geräten zu erstellen. Des Weiteren werden hier der korrekte Ein- und Ausbau der Geräte geleitet sowie kontrolliert. Ebenfalls wird sichergestellt, dass Fehler erkannt und behoben werden können. Der Aufbau und die Funktionen der Anwendung sind in Abbildung \ref{gemo} einsehbar.
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=0.5\textheight]{source/figures/gemo.jpeg}
\caption{Screenshot aus der Anwendung Gemo}
\label{gemo}
\end{figure}
Die gesammelten Daten werden über die Sync-App synchronisiert und ins SAP-System geladen. Zur geschützten Datenübertragung wird das mobile Internet mit der VPN-Technologie^[VPN Virtual private Network ist ein geschlossenes Netzwerk, welches zum Transport privater Daten ein anderes öffentliches Netzwerk nutzt.[@vpn]] verwendet. Wie in Abbildung 2.3 dargestellt wird bei der Synchronisierung von Daten über einen mobilen Client diese mittels RSA verschlüsselt und in einem textbasierten Format (XML) in die Middleware übertragen. Die Anwendungsplattform SAP NetWeaver 7.x wird als Middleware-Komponente genutzt. Mit dieser Anwendung können unterschiedliche Geschäftsprozesse auf einer Plattform integriert werden [@netWeaver] Mithilfe der Middleware werden Backenddaten verwaltet, die speziell für die Benutzung mobiler Anwendungen aufbereitet wurden (SAP NetWeaver Mobile) verwaltet. Die Middleware-Komponente dient vor allem der Verteilung von Benutzer- und Geräteverwaltung sowie Daten- und Softwareaktualisierungen. Die Daten aus der Middleware werden über einen XML-Parser für die AAnbindung ans ERP-System (Backend) decodiert. Mithilfe von RFC (Remote-Function-Calls)^[Remote Function Call: SAP-Schnittstelle ermöglicht Kommunikation zwischen Systemen und führt Funktionen aus.[@rfc]] führt der Parser bestimmte Funktionen aus und strukturiert die Daten.

![Architekturkomponenten bei Brunata [@ach]](Z:/Semester_7/Bachelor_Arbeit/phd_thesis_markdown/source/figures/server.png "Architekturkomponenten bei Brunata [@ach]")

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

Bei der Meldung eines Performance-Problems durch den Monteur werden die Logdaten und die Datenbank des Geräts auf den internen FTP-Server der Brunata geladen. Das gemeldete Problem wird von einem Entwickler überprüft. Dazu untersucht dieser die hochgeladenen Logdaten des Geräts auf das Problem. Dabei dient die für Prozesse und Anfragen benötigte, geloggte Zeit als Anhaltspunkt für das Bestimmen von Leistungsproblemen. Die Logdateien umfassen ca. mindestens 5000 Zeilen und sind nach dem Schema 
[Zeitstempel im ISO8601 Format] [Klasse oder Prozess des Aufrufs] [Log Level] [Ereignis Beschreibung] generiert (siehe auch Abbildung \ref{logs}).
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=1\textheight]{source/figures/logs.PNG}
\caption{Ausschnitt aus einer Logdatei }
\label{logs}
\end{figure}
Die Ereignisbeschreibung für die von Prozessen und Anfragen benötigte Zeit ist nach dem Schema [Prozessname oder Anfrage] [‚took‘] [benötigte Zeit in ms] aufgebaut.

Alle mobilen Anwendungen der Firma Loggen nach demselben, oben benannten Schema. Wegen der Größe der Logdaten und ihrer Auswertung durch einen Entwickler ist der aktuelle Prozess zur Erkennung und zur Behandlung von Leistungsproblemen zeitaufwändig. Daher sollte die Untersuchung der Leistungsdaten vereinfacht werden, was durch die automatisierte Extraktion und Aufbereitung der Leistungsdaten aus den Logdaten realisiert werden kann.
<!--
Der Log ausschnitt in Abbildung \ref{logs} zeigt das Schema nach dem die Logs Generiert werden. Das Schema das verwendet wird ist: [Zeitstempel im ISO8601 Format] [Klasse oder Prozess des Aufrufs] [Log Level] [Ereignis Beschreibung]. Die benötigte Zeit von Prozessen wird geloggt und dient als Anhaltspunkt für Leistungsprobleme. Die durch einen Entwickler zu untersuchenden Logs umfassen ca 5000 Zeilen oder mehr. -->

## Analyse der Daten 

Es gibt eine Vielzahl von Analysetechniken, die zur Extraktion von Informationen aus Daten eingesetzt werden können. Zu diesen zählen maschinelles Lernen, Data-Mining und Text-Mining.
<!--
### Regressionsanalyse 

Die Regressionsanalyse ist ein statistisches Verfahren, mit dem Beziehungen zwischen Variablen ermittelt werden kann.[@reg] Die Regressionsanalyse beginnt mit der Festlegung einer abhängigen Variablen, die das Ergebnis oder das Ausgangsergebnis darstellt, das untersucht werden soll. Danach werden eine oder mehrere unabhängige Variablen identifiziert, die Einfluss auf das Ergebnis haben. Die abhängige Variable ist der Faktor, der durch die unabhängigen Variablen beeinflusst wird. 
-->

### Maschinelles Lernen

Bei maschinellem Lernen handelt es sich um ein Teilgebiet der Künstlichen Intelligenz. Es umfasst Algorithmen, die auf Basis von Trainingsdaten automatisiert erwünschtes Verhalten erlernen.[@Maschinelles] Dabei sollte das Prinzip der Generalisierung gewahrt werden, was bedeutet, dass ein so erstelltes Modell auch mit unbekannten Daten das gewünschte Verhalten liefern kann.

Beim maschinellen Lernen wird zwischen folgenden Arten des Lernens unterschieden:

1. überwachtes Lernen
   
2. unüberwachtes Lernen

3. bestärkendes Lernen

Beim überwachten Lernen wird anhand klassifizierter Daten ein Modell trainiert, in dem unbekannte Eingabewerte auf sinnvolle Zielwerte bezogen abgebildet werden.[@maschArt] Beim unüberwachten Lernen dagegen werden die Daten nicht klassifiziert. Das Modell soll Strukturen, sogenannte Cluster, in den Daten erkennen. Es gibt dabei keinen Zielwert als Vorgabe.[@maschArt] Beim bestärkenden Lernen wird das Modell durch ein Belohnungssystem trainiert. Dazu wird dem Modell durch Belohnung und Bestrafung mitgeteilt, ob seine Entscheidungen korrekt oder falsch waren. Dies hat zur Folge, dass zukünftige Entscheidungen entweder weiterverfolgt oder geändert werden.[@Maschinelles]

Maschinelles Lernen kommt in unterschiedlichen Anwendungen zum Einsatz, in deren Rahmen Erkenntnisse aus Daten zur Lösung praktischer Probleme genutzt werden.[@maschArt] So kann maschinelles Lernen dazu verwendet werden, ein Modell dafür zu trainieren, Muster und Informationen aus Daten zur extrahieren sowie zu bewerten. Allerdings ist die Modellerstellung aufwändig und die Güte des Modells hängt von der Qualität sowie der Quantität der verfügbaren Daten ab.[@maschArt] 

### Data Mining und Text Mining

Data-Mining (im Englischen auch als Knowledge-Discovery in Databases (KDD) bezeichnet)[@maschArt] ist ein Prozess, mit dem Muster und Strukturen aus strukturierten Datenbeständen extrahiert werden.[@data] Es gibt verschiedene Methoden zum Data-Mining, unter anderem Clusteranalysen, die Bayes-Statistik sowie maschinelles Lernen.[@data] 

Im Fall der Clusteranalyse wird versucht, von der zwischen den Objekten vorhandenen Proximität ausgehend eine gegebene Anzahl von Objekten in Gruppen aufzuteilen oder zu Gruppen zusammenzufassen, wobei sowohl eine herkömmliche als auch eine konzeptuelle Clustermethode angewendet werden kann.[@data] Die Cluster werden so konzipiert, dass die Ähnlichkeit der Objekte innerhalb einer Klasse maximiert und die Ähnlichkeit zwischen Objekten verschiedener Klassen minimiert wird.[@data] Das
Bayes-Verfahren beruht auf dem bekannten Theorem von Bayes über bedingte
Wahrscheinlichkeiten, mit dem es die Klassifikation so vorzunehmen gilt, dass die bedingte Wahrscheinlichkeit für die Übereinstimmung der Klassenbildung mit der tatsächlichen Datenstruktur anhand der vorliegenden Daten maximiert wird.[@data] Mithilfe von maschinellem Lernen wird ein Modell trainiert, das ein Objekt aufgrund seiner Attribute in eine vorhandene Klasse einteilt. Techniken dazu wurden in Abschnitt [2.3.2 Maschinelles Lernen](#maschinelles-lernen) behandelt.

Beim Text-Mining handelt es sich um ein Teilgebiet von Data-Mining. Hier werden keine strukturierten Daten, sondern unstrukturierte Texte verarbeitet. Bei der Verarbeitung von Text gibt es einige Besonderheiten im Vergleich zu strukturierten Daten, weshalb im Text-Mining eine Reihe von spezifischen Methoden und Ansätzen genutzt wird.[@textMin] Diese Methoden setzen sich aus Kombinationen verwandter Verfahren, Bereichen wie Data-Mining, maschinellem Lernen und Natural-Language-Processing zusammen.[@textMin] Das Textmining wird zur Extraktion nicht trivialer Muster oder Inhalte aus unstrukturierten sowie teilweise strukturierten Texten verwendet. Der Prozess des Textmining ist ähnlich wie der des Data-Mining. Unterschiede bestehen in den Verfahren, die im Prozess verwendet werden.

Die Voraussetzung für ein aussagekräftiges Ergebnis bei Data- und Text-Mining bildet die Qualität der Daten: Fehlerhafte oder unvollständige Daten wirken sich negativ auf das Ergebnis aus. Der Schutz der Daten vor Missbrauch und Diebstahl sowie die Einhaltung der geltenden Datenschutzverordnung bei der Verarbeitung sind beim Data-Mining sicherzustellen und bedeuten meist eine Herausforderung. 

### Bewertung

Der Aufwand und die Komplexität dessen, ein Modell auf Grundlage von maschinellem Lernen zu trainieren, sind im Vergleich zu den Alternativen hoch. Obwohl das Verfahren maschinellen Lernens geeignet wäre, um Informationen aus den Logdaten zu extrahieren und diese sogar automatisiert zu bewerten, wird der Ansatz begründet durch den Aufwand, die Komplexität und die unsichere Qualität des Ergebnisses vorliegend nicht zur Lösung der Problemstellung verwendet. Allerdings könnte der Einsatz dieses Verfahren in einer weiterführenden Arbeit untersucht werden. Da in dieser Arbeit Informationen aus Logdaten extrahiert werden sollen, die in Textform vorliegen, kommt im weiteren Verlauf Text-Mining zum Einsatz.

##  CRISP-DM: Prozessmodell für Analyseprojekte

### Überblick

Ein standardisiertes und strukturiertes Vorgehen ermöglicht es, den Einstieg in die Durchführung von Analyseprojekten zu erleichtern und diese zu beschleunigen, die Planung und die Verwaltung der erforderlichen Aktivitäten zu vereinfachen sowie die Validität und die Verlässlichkeit der Ergebnisse zu erhöhen. Darüber hinaus werden mit einem solchen Prozessmodell die Wiederholbarkeit und die Nachvollziehbarkeit aller ausgeführten Verarbeitungsschritte und Entscheidungen maximiert, was die Dokumentation und die Wiederverwendung von Erfahrungen erleichtert. Schließlich hilft ein gemeinsames Verständnis des allgemeinen Ablaufs einer Datenanalyse bei der Kommunikation zwischen allen Beteiligten. Der Cross-Industry-Standard-Process for Data-Mining (CRISP-DM) ist ein weitverbreitetes und ausgereiftes Prozessmodell, mit dem ein Analyseprojekt hierarchisch auf vier Abstraktionsebenen heruntergebrochen wird. Auf der obersten Ebene wird der Analyseprozess wie in Abbildung \ref{crisp} dargestellt in sechs Phasen unterteilt und abgedeckt.[@maschArt2]
<!-- Es gibt verschiedene Modelle, um Data Mining bzw. Text Mining Prozesse zu entwickeln.[@data] Ein branchenübergreifende Prozess dafür ist CRISP-DM (CRoss-Industry Standard Process for Data Mining) siehe Abbildung \ref{crisp}.-->
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=1\textheight]{source/figures/crisp.png}
\caption{Prozessdiagramm zur Beziehung zwischen den verschiedenen Phasen des CRISP-DM-Prozesses(vgl.IBN SPSS Modeler CRISP-DM Guide)}
\label{crisp}
\end{figure} 

In dieser Arbeit wird der Fokus auf die fachlichen und analytischen Komponenten der Phasen gelegt. Für eine umfassendere Erläuterung der Thematik ist auf die ausführliche CRISP-DM-Dokumentation zu verweisen.[@chapman]
Der Analyseprozess beginnt mit dem Business-Understanding, folgt aber keinem streng linearen Ablauf. Da während der Analyse neue Erkenntnisse gewonnen werden, müssen einzelne Phasen häufig mehrfach durchlaufen werden. Wenn es inhaltlich sinnvoll ist, ist ein beliebiger Sprung von einer Phase zu einer anderen möglich. Mit den Pfeilen im Schaubild (siehe Abbildung \ref{crisp}) werden die in einem Analyseprojekt am häufigsten zu beobachtenden Sprünge angezeigt. Der äußere Kreislauf symbolisiert, dass der gesamte Analyseprozess oft mehrfach passiert wird.[@chapman] [@maschArt2]

### Business Understanding

Der Analyseprozess beginnt mit dieser Phase, in der es gilt, den fachlichen Kontext und die Rahmenbedingungen des Anwendungsszenarios zu verstehen sowie die fachlichen Anforderungen und Ziele mit angemessenen Erfolgskriterien zu bestimmen. Es ist von besonderer Bedeutung, nachzuvollziehen, warum dieses Projekt für das Unternehmen von Nutzen ist und wie die Ergebnisse der Analyse verwendet werden sollen. Ohne messbare Zielsetzungen gestaltet sich eine spätere Evaluierung der Analyseergebnisse problematisch. Erfahrungen aus vorhandenen
Problembehandlungen innerhalb des Unternehmens sollten deshalb in die Betrachtung inkludiert werden.

### Data Understanding

In der Data-Understanding-Phase erfolgt eine Initialanalyse der zur Verfügung stehenden Daten. Hierbei werden relevante und geeignete Datenquellen identifiziert sowie erste Erkenntnisse über die Daten gewonnen. Die mangelnde Datenqualität sowie die häufig begrenzten Möglichkeiten, diese zu verbessern, stellen ein signifikantes Risiko der erfolgreichen Analyse dar. Daher ist es erforderlich, Maßnahmen zur Erhöhung der Datenqualität einzuleiten. In ihrem Rahmen gilt es unter anderem alternative Datenquellen zu erschließen, um Relevanz, Menge und Qualität der Datenbasis zu erhöhen. Ziele sowie Erwartungshaltungen können durch einen Sprung in die erste Phase korrigiert werden.

### Data Preparation

Die Data-Preparation-Phase dient dem Ziel, Daten in einem Format aufzubereiten, dass für die nachfolgenden Methoden der Modellierungsphase angemessen ist.
Die Datenaufbereitung umfasst eine Reihe von Schritten, darunter die Integration von Daten aus verschiedenen Quellen, die Auswahl der zu verwendenden Datensätze und Merkmale, die Bereinigung, die Transformationen, die Normalisierung und das Ableiten neuer Merkmale sowie die Formatierung. Während die Bereinigung und die Transformation eine semantische Änderung der Daten bedeuten, bezieht sich die Formatierung ausschließlich auf Änderungen syntaktischer Natur, die dazu dienen, die Daten für den Einsatz der vorgesehenen Methoden und Werkzeuge aufzubereiten. Die Datenaufbereitung gilt als zentraler Erfolgsfaktor von Analyseprojekten. Da für den Einsatz verschiedener Verarbeitungsmethoden unterschiedliche Anforderungen an die
Daten gestellt werden, gibt es keine ideale Form der Datenaufbereitung. Die individuell geeignete Gestaltungsweise wird durch ein
Wechselspiel zwischen der Datenvorbereitung und der nachfolgenden Modellierungsphase ermittelt.

### Modeling

In der Modellierungsphase werden geeignete Methoden für die jeweilige Analyseaufgabe ausgewählt und angewendet. Dabei müssen verschiedene Einflussfaktoren berücksichtigt werden – etwa die Beschaffenheit der Daten, die Verfügbarkeit von Methoden in entsprechenden Analysewerkzeugen und letztlich Anforderungen des Unternehmens. Wird eine Methode als adäquat erachtet, wird sie zum Zweck der Evaluierung in die nächste Phase überführt.

### Evaluation

Es wird im Allgemeinen angenommen, dass durch eine intensive Suche auch in zufällig erzeugten Datenbeständen Muster identifiziert werden können, die statistisch signifikant sind (vgl. Schacht und Lanquillon 2019). Die Evaluierung dieser Muster hinsichtlich ihrer Anwendbarkeit und Relevanz für ein Unternehmen ist jedoch unerlässlich, bevor sie zur Lösung einer fachlichen Fragestellung kommuniziert sowie angewendet werden. Der Zweck der Evaluierung besteht darin, den Nutzen der Analyseergebnisse im Kontext der Anwendung zu überprüfen und letztlich die Methode auszuwählen, mit der die Anforderungen unter Berücksichtigung der Erfolgskriterien am besten erfüllt werden. Dazu sind Ziele und Erfolgskriterien, die in der Phase Business-Understanding definiert wurden, zu berücksichtigen. Darüber hinaus sollte in dieser Phase der gesamte bisherige Analyseprozess einer Prüfung unterzogen werden. Welche Evaluierungsmethoden und -kriterien geeignet sind, hängt stark von der spezifischen Analyseaufgabe ab.

### Deployment

Mit dieser Phase wird sichergestellt, dass die Ergebnisse der Analyse den Anforderungen entsprechen, die mit der geplanten Anwendung verbunden sind. Der Begriff ‚Deployment‘ bezieht sich im gegebenen Kontext auf die Planung und die Umsetzung der Anwendung der Ergebnisse. Die Spannbreite der möglichen Nutzungsbereiche der Resultate reicht von einem einmaligen Erkenntnisgewinn durch Interpretation und Verstehen über eine einmalige manuelle Anwendung eines Modells auf einen ausgewählten Datenbestand bis hin zu einer regelmäßigen automatischen Anwendung, die durch die Integration in betroffene Geschäftsprozesse realisiert wird. Bei einer regelmäßigen Anwendung muss das Modell kontrolliert und gewartet werden, um auf Veränderungen im Anwendungskontext oder in der Umwelt angemessen zu reagieren.[@maschArt2]
<!--
Text Mining ist ein Teilgebiet von Data Mining. Dabei werden keine Strukturierten Daten sondern unstrukturierte Texte verarbeitet.<!-- Text Mining ist eine Erweiterung von Data Mining wenn es sich bei den behandelten Daten um einen Text handelt.-> Bei der Verarbeitung von Text gibt es einige Besonderheiten im Vergleich zu Strukturierten Daten. Text Mining hat dazu eine Reihe von spezifischen Methoden und Ansätze.[@textMin] Die Methoden setzten sich dabei aus Kombinationen Verwandter Verfahren, Bereiche wie Data Mining, Maschinellem Lernen und natural language processing, zusammen. [@textMin] Das Text Mining wird verwendet zur Extraktion, nicht Triviale Muster oder Inhalte aus unstrukturierten oder Teilweise Strukturieren Texten. Der Prozess für das Text Mining ist ähnlich wie beim Data Mining. Sie unterscheiden sich in in den Verfahren die im Prozess verwendet werden. -->

 <!--
 mithilfe der Logs das gemeldete Problem. Falls ein Problem nachgewiesen wird durch den Entwickler behandelt er dieses. 
Über die in Abbildung \ref{logs} zu sehenden Knopf "Logdatein senden" werden die Logdaten des Gerätes auf den Internen FTP-Server der Brunata hochgeladen.


Abbildung \ref{logs} zeigt das Schema für den aufbau der logs auf.
Die Logs sind dabei nach folgendem Schema aufgebaut: Zeitstempel im ISO8601 Format des Aufrufs, Klasse oder Prozess des Aufrufs, Loglevel und Beschreibung des Ereignis. Ein Beispiel In der Abbildung \ref{logs} ist ein Ausschnitt aus einer Logdatei und das Schema der logs zu sehen. Ein Log beginnt mit dem 

 Tritt bei der Verwendung einer Mobilen Anwendung der Brunata ein Performanzproblem auf kann der Monteur das Problem Melden. Dabei werden die Logdaten und die Datenbank des Geräts auf den Internen FTP-Server der Brunata hochgeladen. Ein Entwickler untersucht über die gesendete Logdatei das gemeldete Problem.

\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{source/figures/logssenden.jpeg}
\caption{Ausschnitt aus der Gemo App zum Hochladen der Geräte Logs}
\label{logs}
\end{figure}
Abbildung \ref{logs} 
 und über die Anwendung die Logs und Datenbank seines Gerätes auf den Internen FTP-Server der Brunata Hochladen. 
kann der Monteur nach Abschluss der Arbeit das Problem Melden und die Logs und Datenbank seines Geräts auf den internen FTP-Server der Brunata Hochladen

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
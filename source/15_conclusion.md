# Fazit


<!--
Ein Kapitel, das die Arbeit durch Zusammenfassung der Lernpunkte und Skizzierung der zukünftigen Forschungsbereiche abschließt.


## Zusammenfassung der Arbeit


Das Ziel dieser Bachelorarbeit war es, Leistungsprobleme in Mobilen Anwendungen der Firma Brunata zu erkennen um sie beheben zu können. Dabei haben sich die Logdaten der Anwendungen und die benötigte Zeit von Prozessen und Anfragen in den Logdaten als grundlage zur Erkennung von Leistungsproblemen erwiesen. Es wurde erkannt das zur Extraktion aus den Logdaten ein

Das Ziel dieser Bachelorarbeit war es, bisher unerkannte Leistungsprobleme in den Mobilen Anwendungen der Firma Brunata zu erkennen um sie beheben zu können. Dabei hat sich die in den logs der Anwendung Dokumentierte benötigte Zeit von Prozessen und Anfragen als grundlage zur Erkennung von Leistungsproblemen herausgestellt. Aus der Untersuchung der Verfahren zur Analyse der Daten ergibt sich, dass die Extraktion benötigter Zeit von Prozessen und Anfragen aus den Logdaten durch Text Mining realisiert wird

Das Ziel dieser Bachelorarbeit war es, bisher unerkannte Leistungsprobleme in den Mobilen Anwendungen der Firma Brunata zu erkennen um sie beheben zu können. Zur Realisierung wurde die ausgangslage der Anwendungen untersucht, mögliche Verfahren zur Lösung der Problemstellung analysiert und ein Verfahren zur Erfüllung der Zielstellung Implementierung.

Die Untersuchung zeigt, dass die von den Anwendungen Dokumentierte benötigte Zeit von Prozessen und Anfragen als Indikator für Leistungsprobleme dient. Die Extraktion benötigter Zeit von Prozessen und Anfragen aus den Logdaten wird durch einen Text Mining Prozess realisiert. Zur Implementierung des Prozesses wird Elasticsearch und Kibana verwendet.

Zusammenfassend lässt sich festhalten, dass zur Implementierung des Text Mining Verfahrens im Analyseprozess Elasticsearch und Kibana den Vorschriften des Unternehmen, das Daten ausschließlich intern zu verarbeiten gerecht werden. Kibana Elasticsearch übernimmt die Vorverarbeitung und Extraktion der Leistungsdaten

Die Untersuchung zeigt, dass die von den Anwendungen Dokumentierte benötigte Zeit von Prozessen und Anfragen als Indikator für Leistungsprobleme dient. Die Extraktion benötigter Zeit von Prozessen und Anfragen aus den Logdaten wird durch einen Text Mining Prozess realisiert. Zur Implementierung des Prozesses wird Elasticsearch und Kibana verwendet.

Zusammenfassend lässt sich festhalten, dass die Implementierung eines Text Mining Prozesses mithilfe von Elasticsearch und Kibana die Leistungsdaten von Anwendungen in Grafischer Form darstellt und durch deren Auswertung Leistungsprobleme Identifiziert.
-->
<!--
Die Untersuchungen zeigen, dass es mit einem Text Mining Prozess zur Extraktion von Leistungsdaten und ihrer Grafischen Darstellung möglich ist, Leistungsprobleme zu erkennen.

Aus den Untersuchungen schließt sich, dass zur Erkennung von Leistungsproblemen Text Mining zur Extraktion von Leistungsdaten aus den Logs und Grafisch Darstellung verwendet wird.
das Leistungsdaten geloggt werden und zur Erkennung von Leistungsproblemen genutzt werden. Des weiteren ergaben die Untersuchungen das der Text Mining Prozess als Verfahren zur Leist genutzt wird. Zur Implementierung des Text Mining Prozesses wird Elasticsearch und Kibana verwendet.

Aus den Untersuchungen schließt sich, dass die Extraktion benötigter Zeit von Prozessen und Anfragen aus den Logdaten mittels Text Mining eine sinnvolle Methode zur Ermittelung der Leistungsdaten darstellt. Zur Implementierung des Text Mining Prozesses wird Elasticsearch und Kibana verwendet.

Durch diese Implementierung wurden Leistungsprobleme
-->
## Ausblick

<!-- Inspect CPU als erweitrung ausblick --> 
Die hier dargestellten Ergebnisse werfen weiterführende Fragen auf. Was wäre, wenn im Analyseprozess ein Modell trainiert wird, um die Leistungsdaten zu extrahieren und Leistungsprobleme automatisiert zu erkennen? Zur grafischen Auswertung und Problemerkennung wird ein Mitarbeiter benötigt, dieser Prozess kostet Zeit und Ressourcen. Durch ein Modell, welches selbstständig die extrahierten Daten bewertet und Leistungsprobleme erkennt, würde es möglich werden, die Problemerkennung vollständig zu Automatisieren und Ressourcen anderweitig zu verteilen. Der Initiale aufwand und die Kosten ein geeignetes Modell zu trainieren und zu entwickeln, stehen in Betracht der Ersparnis einer Entwicklung nicht im Weg. Jedoch ist bei einer vollständig automatisierten Verarbeitung eine Untersuchung der Vereinbarkeit des Vorhabens mit der geltenden Datenschutzverordnung notwendig.

Die folgende weiterführende Forschungsfrage ließe sich an die automatisierte Erkennung von Leistungsproblemen anschließen. Ist es möglich, die Logdaten automatisch zu verarbeiten und eine Überschreitung eines festgelegten Grenzwertes der benötigten Zeit zu melden? Nach Verbesserungen können Leistungsprobleme in unerwarteten Prozessen entstehen. Eine automatisierte Warnung ermöglicht eine schnelle und effiziente Erkennung von Leistungsproblemen nach einer Verbesserung. Zusätzlich wird sichergestellt, dass eine Verbesserung den gewünschten Effekt erzielt ohne Untersuchung durch einen Entwickler. Die technische Möglichkeit der automatisierten Verarbeitung wird von der Open-Source Anwendung Logstash angeboten. Logstash kann in einem Docker Container Laufen und auf eine HTTPS-Adresse hören und alle eingehenden Logs automatisch verarbeiten und an Elasticsearch weitergeben. Das entwickelte Verfahren könnte somit um eine Logstash Instanz erweitert werden. Die Überwachung und automatisierte Meldung wird von Kibana bereitgestellt.

Des Weiteren kommt die Frage auf, wie können die entdeckten Leistungsprobleme weiter untersucht und eine Lösung gefunden werden? Nachdem ein Leistungsproblem entdeckt wurde, wird dieses weiteruntersucht, um den Ursprung für das Problem zu finden und es zu beheben. Mit der Anwendung Inspect CPU bietet Google die Möglichkeit, die benötigte CPU zeit von Mobilen Anwendungen in Echtzeit oder von aufgezeichneten "Traces" nachzuvollziehen.[@dev] Damit kann eine Optimierung der mobilen Anwendung vorgenommen werden und ein Leistungsproblem genauer betrachtet und untersucht werden.
<!--Für die Beantwortung dieser Frage ist eine detailliertere Untersuchung der Anwendung erforderlich um ein passendes Verfahren zu ermitteln und zu entwerfen das zum gewünschten Ziel führt. 

Die hier dargestellten Ergebnisse führen zu der Frage was wäre, wenn die Leistungsdaten nicht durch Extraktion aus den logdaten, sondern mittels Schnittstellen aufgenommen und Verarbeitet werden?
Die Daten werden nicht mehr einfach extrahiert und Grafisch aufbereitet sondern werden von einem Algorithmus bewertet. Die technischen Möglichkeiten, Daten aufgrund von ihren Eigenschaften zu bewerten, existieren bereits. Diese Technik wird Künstliche Inteligenz genannt und ist bereits im Intern

Für die Beantwortung, dieser Frage ist eine detailliertere Untersuchung erforderlich, die über einfache information's Extraktion und Darstellung hinausgeht. In einer solchen Studie könnte
Durch die vorgestellten Ergebnisse lassen sich weiter Fragen aufwerfen: Was wäre wenn eine Auswertung nicht auf gemesGrafisch durch einen Entwickler, sondern automatisiert durch einen Algo
-->

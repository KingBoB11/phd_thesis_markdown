# Ausblick


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
Aus den vorliegenden Ergebnissen folgen weiterführende Fragen. Beispielsweise bleibt es ungeklärt, was passieren würde, wenn im Analyseprozess ein Modell trainiert wird, um die Leistungsdaten zu extrahieren und Leistungsprobleme automatisiert zu erkennen: Zur grafischen Auswertung und zur Problemerkennung wird aktuell ein Mitarbeiter benötigt, weshalb der Prozess Zeit und Ressourcen kostet. Durch ein Modell, das die extrahierten
Daten selbstständig bewertet und Leistungsprobleme erkennt, würde es möglich werden, die
Problemerkennung vollständig zu automatisieren und Ressourcen anderweitig zu verteilen. Der initiale Aufwand und die Kosten dessen, ein geeignetes Modell zu trainieren sowie zu entwickeln, stehen in Betracht der Ersparnis einer Entwicklung nicht im Weg. Jedoch ist für eine vollständig automatisierte Verarbeitung eine Untersuchung der Vereinbarkeit des Vorhabens mit der geltenden Datenschutzverordnung notwendig.


Mit folgender weiterführenden Forschungsfrage könnte an die automatisierte Erkennung von Leistungsproblemen angeknüpft werden: Ist es möglich, die Logdaten automatisch zu verarbeiten und die Überschreitung eines festgelegten Grenzwertes für die benötigte Zeit zu melden?. Nach Verbesserungen können Leistungsprobleme in unerwarteten Prozessen entstehen. Eine automatisierte Warnung ermöglicht eine schnelle und effiziente Erkennung von Leistungsproblemen nach einer Verbesserung. Zusätzlich wird sichergestellt, dass eine Verbesserung den gewünschten Effekt erzielt – auch ohne Untersuchung durch einen Entwickler. Die technische Möglichkeit der automatisierten Verarbeitung wird von der Open-Source-Anwendung Logstash angeboten. Logstash kann in einem Docker-Container laufen und an eine HTTPS-Adresse geknüpft sein, wobei alle eingehenden Logs automatisch verarbeitet und an Elasticsearch weitergegeben werden. Das vorliegend entwickelte Verfahren könnte somit um eine Logstash-Instanz erweitert werden. Die Möglichkeit zur Überwachung und zur automatisierten Meldung werden bereits von Kibana bereitgestellt.

Des Weiteren kommt die Frage auf, wie die entdeckten Leistungsprobleme weiter untersucht und gelöst werden können. Nachdem ein Leistungsproblem identifiziert wurde, wird dieses weiter untersucht, um seinen Ursprung zu finden und es zu beheben. Mit der Anwendung Inspect CPU (Central Prozessing Unit) bietet Google die Möglichkeit, die benötigte CPU-Zeit von mobilen Anwendungen in Echtzeit oder anhand aufgezeichneter ‚Traces‘ nachzuvollziehen.[@dev] Damit kann eine Optimierung der mobilen Anwendung vorgenommen und ein Leistungsproblem genauer betrachtet sowie untersucht werden.
<!--Für die Beantwortung dieser Frage ist eine detailliertere Untersuchung der Anwendung erforderlich um ein passendes Verfahren zu ermitteln und zu entwerfen das zum gewünschten Ziel führt. 

Die hier dargestellten Ergebnisse führen zu der Frage was wäre, wenn die Leistungsdaten nicht durch Extraktion aus den logdaten, sondern mittels Schnittstellen aufgenommen und Verarbeitet werden? 
Die Daten werden nicht mehr einfach extrahiert und Grafisch aufbereitet sondern werden von einem Algorithmus bewertet. Die technischen Möglichkeiten, Daten aufgrund von ihren Eigenschaften zu bewerten, existieren bereits. Diese Technik wird Künstliche Inteligenz genannt und ist bereits im Intern

Für die Beantwortung, dieser Frage ist eine detailliertere Untersuchung erforderlich, die über einfache information's Extraktion und Darstellung hinausgeht. In einer solchen Studie könnte 
Durch die vorgestellten Ergebnisse lassen sich weiter Fragen aufwerfen: Was wäre wenn eine Auswertung nicht auf gemesGrafisch durch einen Entwickler, sondern automatisiert durch einen Algo
-->


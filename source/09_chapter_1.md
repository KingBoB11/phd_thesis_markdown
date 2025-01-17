# Einleitung

## Ausgangslage

Angesichts dessen, dass die Leistung von mobilen Anwendungen im hohen Maße deren Popularität und deren von Nutzern wahrgenommene Dienstqualität bestimmt (vgl. Dikaiakos und Samaras 2001, 148; Bhatti, Bouch und Kuchinsky 2000),kommt dem Markt für Performance-Evaluation steigende Beliebtheit zu.^[vgl. Gartner Report Magic Square] So steuert beispielweise Google die Sichtbarkeit von mobilen Anwendungen im Playstore in Abhängigkeit der Ergebnisse der Performance-Evaluation[@perAndr]. Dementsprechend besteht ein hohes Interesse daran, die Performance zu optimieren, da hierdurch nicht nur die Nutzerfreundlichkeit der App verbessert, sondern auch ihre Sichtbarkeit erhöht wird. Ein Unterfeld der Performance-Evaluation bezieht sich auf die Verarbeitung von Logs. Diese werden benutzt, um Ereignisse zu dokumentieren oder Entwicklern die Suche nach Fehlern zu erleichtern. Hierzu werden verschiedene Logebenen[@android], Zeitstempel oder Schemata verwendet, wodurch viele Möglichkeiten entstehen, das Geloggte zu verarbeiten. Sind Logs nicht nach einem einheitlichen Schema dokumentiert, gilt es unterschiedliche Strukturen zu verarbeiten. Demnach ist die Verarbeitung von Logs schwierig, weil sich die Komplexität laufend erhöht.
<!--
Die zunehmende Nutzung mobiler Geräte hat zu einer starken Verbreitung mobiler Anwendungen geführt, die für eine Vielzahl von Aufgaben wie Kommunikation, soziale Netzwerke, Unterhaltung und Produktivität eingesetzt werden. Dies wird ersichtlich, wenn die Schätzung zur Anzahl der Downloads von Apps nach App-Stores weltweit in den Jahren 2017-2021 betrachtet wird siehe Abbildung \ref{stat}
\begin{figure}
\centering
\includegraphics[width=1\textwidth,height=\textheight]{Z:/Semester_7/Bachelor_Arbeit/phd_thesis_markdown/source/figures/statistic.png}
\caption{Beispieldatensatz der Abspeicherung von Geräte Logs auf dem FTP-Server
\label{stat}}
\end{figure}
-->
<!--

Angesichts dessen das die Leistung von Mobilen Anwendungen im hohen Maße die Popularität und die von Nutzern wahrgenommene Dienstqualität bestimmt^[Vgl. Performance Evaluation of Mobile Agents: Issues and Approaches S.148[@Dikaiakos2001] & Vgl. Computer Network 33 S.1-16[@studie]] muss sichergestellt werden, dass die Anwendungen den Leistungsanforderungen der Nutzer gerecht werden. Neben Stresstest zur gewährleistung der Leistung befassen sich immer mehr Unternehmen mit dem Thema der Performance Evaluation. <!--So ist es unvermeidlich die Leistung der Anwendung zu Evaluieren, Verbesserungspotenzial zu ermitteln und Umzusetzen. Die Performance Evaluation der Mobilen Anwendungen im Playstore wird von Google zur Steuerung der Sichtbarkeit genutzt.  So steuert beispielweise Google die Sichtbarkeit von Mobilen Anwendungen im Playstore basierend auf deren Performance Evaluation[@perAndr].



Ein Häufiger Kritikpunkt an Mobilen Anwendungen sind auftretende Performance Probleme, wie etwa lange ladezeiten. Aufgrund dessen das Performance Probleme lediglich zur Beeinträchtigung der benutzererfahrung führen und nicht zum Absturz der Anwendung werden diese Probleme nicht automatisch an die Entwickler übermittelt.

Ein Häufiger Kritikpunkt an den Mobilen Anwendungen der Brunata sind auftretende Performance Probleme, wie etwa lange ladezeiten. Ein solches Probleme kann aufgrund dessen das die Anwendung nur in ihrer Geschwindigkeit eingeschränkt ist, nicht automatisch gemeldet werden. Deshalb müssen Monteure nach Abschluss ihrer Arbeit sich mit dem Problem gesondert bei der Internen Support Hotline Melden. Die Nutzung von Stresstests mit verschiedenen Daten reicht nicht aus um alle Performance Probleme die im real betrieb auftreten können zu erkennen. Wenn man die Performance der Anwendungen Evaluiert, so könnten Performance Probleme früher und ohne Feedback der Nutzer erkannt und behoben werden. Daher wird im Rahmen dieser Forschungsarbeit der Frage nachgegangen, wie eine Performance Evaluation für eine Mobile Anwendung der Brunata realisiert werden kann.


Angesichts dessen, dass die Leistung von Mobilen Anwendungen im hohen Maße die Popularität und die von Nutzern wahrgenommene Dienstqualität bestimmt^[Vgl. Performance Evaluation of Mobile Agents: Issues and Approaches S.148[@Dikaiakos2001] & Vgl. Computer Network 33 S.1-16[@studie]], erfreut sich der Markt für Performance Evaluation steigender Beliebtheit^[Vgl. Gartner Report Magic Square]. <!--ist die Nutzung von Performance Evaluation ein immer Wichtiger Schritt in der Softwareentwicklung.-> So steuert beispielweise Google die Sichtbarkeit von Mobilen Anwendungen im Playstore basierend auf den Ergebnissen der Performance Evaluation[@perAndr]. Ein Unterfeld der Performance Evaluation beschäftigt sich mit der Verarbeitung von Logs. Das Spannende dabei ist die Komplexität der Logs. Sie werden benutzt, um Ereignisse zu Dokumentieren oder, um Entwicklern die suche nach Fehlern zu erleichtern. Man bedient sich an verschiedenen Log Ebenen[@android], Zeitstempeln oder Schemata, wodurch mehrere Möglichkeiten entstehen können, das Geloggte zu verarbeiten. Sind Logs nicht einheitlich nach dem selben Schema Dokumentiert, gibt es unterschiedliche Strukturen zu Verarbeiten. Das heißt, dass eine Verarbeitung von Logs extrem Schwierig, aber dementsprechend spannend ist.
-->
<!--
Meldung die
Ziel ist es die Auftretenden Probleme zu ermitteln und Grapghisch aufzuarbeiten
die inhouse tests reichen nicht aus
In den letzten Jahren ist der Markt für Performance Evaluation Lösungen stetig gewachsen. Es entstehen zunehmend Anbieter
Angesichts dessen das die Leistung von Mobilen Anwendungen im hohen Maße die Popularität und die von Nutzern wahrgenommene Dienstqualität bestimmt^[Vgl. Performance Evaluation of Mobile Agents: Issues and Approaches S.148[@Dikaiakos2001] & Vgl. Computer Network 33 S.1-16[@studie]] muss sichergestellt werden, dass die Anwendung den Leistungsanforderungen der Nutzer gerecht wird. Google nutzt die Performance Evaluation der Mobilen Anwendungen im Playstore zur Steuerung der Sichtbarkeit im Playstore.  
Die Performance Evaluation, ein Prozess zur Bewertung der Qualität, Zuverlässigkeit und Leistung einer Anwendung, wird unter anderem von Google zur Steuerung der Sichtbarkeit von Mobilen Anwendungen im Playstore benutzt[@preAndr] und ist immer wichtiger in der Softwareentwicklung, angesichts dessen das die Leistung von Mobilen Anwendungen im hohen Maße die Popularität und die von Nutzern wahrgenommene Dienstqualität bestimmt^[Vgl. Performance Evaluation of Mobile Agents: Issues and Approaches S.148[@Dikaiakos2001] & Vgl. Computer Network 33 S.1-16[@studie]] ist die Performance Evaluation Mobiler Anwendungen ein wichitger . Dabei umfasst der Prozess in der regel das Sammeln und Analysieren von Metriken. Ein Unterfeld der Performance Evaluation beschäftigt sich mit der Verarbeitung von relevanten Daten. Das Spannende dabei ist die Komplexität der Daten. Dabei können grundsätzlich alle Daten welche Rückschluss auf die Performance der Anwendung geben relevant sein. Ob sie Schlussendlich relevant sind ist jedoch abhängig vom anwendungsgebiet und der Anwendung. So reichte früher der Vergleich von CPU Zyklen^[Vgl. Performance Evaluation and Monitoring 1971 S.81 [@perfomance_evaluation]]. In Modernen Mobilen Anwendungen gibt es jedoch weit aus mehr Leistungsindikatoren. Das führt dazu, dass es verschiedene möglichkeiten der  
 Die Performance Evaluation Mobiler Anwendungen, ein Ansatz welcher von Google genutzt wird um die Sichtbarkeit von Mobilen Anwendungen im Playstore zu steuern,
ist der Prozess zur Bewertung der Qualität, Zuverlässigkeit und Leistung einer Mobilen Anwendung. Dieser Prozess umfasst in der Regel das Sammeln und Analysieren von Metriken wie Reaktionszeit, Speichernutzung, Energieverbrauch und Benutzererfahrung sowie anderer Faktoren.[@perAndr]Die Bewertung hilft den Entwicklern, fundierte Entscheidungen über Design und die Funktionalität ihrer Produkte zu treffen, und kann auch dazu verwendet werden, Verbesserungswürdige Bereiche zu ermitteln.[@Dikaiakos2001]
-->

## Das Unternehmen Brunata-Metrona

Die BRUNATA METRONA GmbH & Co. KG hat ihren Ursprung im Jahr 1958.
Die damals innovative und heute übliche Gestaltungsweise, dass jeder Haushalt nur seinen tatsächlichen Wärme- und Wasserverbrauch bezahlen muss, war damals Anreiz und Idee für die Firma BRUNATA Wärmemesser GmbH & Co. KG. Mittlerweile ist das Unternehmen unter dem Namen BRUNATA METRONA GmbH & Co. KG. tätig. Zum Geschäftsfeld der Brunata zählt unter anderem die Installation von fernablesbaren Messgeräten wie Heizkostenverteilern und Wasserzählern, die zur Ermittlung der Heiz- und Wasserkosten dienen. Den Mess- und Montagepartnern wird die eigens entwickelte mobile Anwendung Gemo zur Verfügung gestellt, in der von der Planung eines Auftrags bis zum Ablesen einer Liegenschaft alle Aufgaben eines Monteurs gesteuert werden können.

## Problemstellung und Zielsetzung

Jedes Jahr werden in der Brunata Abrechnungen für ca. 125 000 Liegenschaften erstellt. Nach einem Zeitraum von zwölf Monaten werden die Verbrauchsstände von einem Ableser erfasst. Die gesammelten Daten werden mithilfe der eigens entwickelten Gemo-App verarbeitet und anschließend ins SAP-System übertragen. Bei Nutzung dieser App können Fehler entstehen, wobei Abstürze der App automatisch gemeldet werden. Manche dieser Fehler führen nicht zu einem Absturz der App, sondern beeinträchtigen lediglich die Leistung, indem sie z. B. eine lange Ladezeit begründen. Diese Fehler müssten vom Monteur nach Abschluss der Arbeit selbstständig gemeldet werden. Diese Gestaltungsweise hat zur Folge, dass Performance-Probleme lange unerkannt bleiben, Arbeitsprozesse länger dauern als notwendig und ein erhöhter Personal- sowie Kostenaufwand zur Behandlung und zur Ermittlung dieser Probleme notwendig ist. Es folgt die Problematik, dass nicht alle Performance-Probleme, die im Realbetrieb auftreten können, durch den aktuellen Umfang der genutzten Tests erkannt werden. Das Ziel dieser Arbeit ist es auf dieser Basis, ein Verfahren zu implementieren, mit dem bisher unerkannte Leistungsprobleme wie lange Ladezeiten erkannt und behoben werden. Dazu werden aktuelle Verfahren und Techniken analysiert, um eine passende Version umzusetzen.

<!--
der aktuelle Umfang des Testing nicht ausreicht um alle Performance Probleme zu erkennen die im real betrieb auftreten können.
Das wirft die Problematik auf das die aktuelle Nutzung von Stresstests mit verschiedenen Daten alleine nicht ausreicht um alle Performance Probleme die im real betrieb auftreten können zu erkennen.

EInarbeitung kostet geld bzw Schlecht fürs unternehemn einabu das Monteure melden können

Das Ziel dieser Arbeit ist es, eine Performance Evaluation zu erstellen, die die im betrieb befindlichen Gemo-Apps Evaluiert, sodass mithilfe der Graphischen Darstellung der Leistung, im real betrieb auftretende Performance Probleme, erkannt und behoben werden können. Ein Zufriedenstellendes Ergebnis wird erlangt, wenn Graphisch die benötigte Zeit für Prozesse der Gemo-App dargestellt wird.

Das Ziel dieser Arbeit ist die Auseinandersetzung mit der Thematik "Performance Evaluation Mobiler Anwendungen" und der Implementierung einer Performance Evaluation der GEMO App. Um dieses Ziel zu erreichen, wird zunächst die bestehende Anwendung identifiziert, Essentielle Aspekte der Performance Evaluation ermittelt und bestehende Technologien analysiert. Anschließend wird jeweils für die ermittelten Aspekte ein Technologienvergleich gezogen, der die für die Anwendung geeignetste Implementierung wählen soll. Zum Schluss soll die Evaluation Graphisch Dargestellt werden, um eine erleichterte Übersichtlichkeit zu ermöglichen. Durch die Flächendeckende Performance Evaluation der sich in Nutzung befindlichen GEMO Apps, sollen Probleme in der Anwendung schneller erkannt und effizienter behoben werden.<!-- Kommt Wahrscheinlich weg  Die erhaltenen Informationen in strukturierter und Informativer Graphischen Darstellung sind für das Unternehmen selbst sowie für die Entwickler eine Unterstützung.-->



<!--
## Struktur und Vorgehensweise
kursiv: * auf beiden Seiten des Textes
fett: **
kursiv und fett: ***

Ich bin mir noch nicht sicher was ich anstelle dessen hinschreibe ich habe mir überlegt ich könnte die Aufgabenstellung präzisieren aber bin mir nicht sicher ob das so wirklich sinn macht.

Dies ist ein kurzer Überblick darüber, was in jedem Kapitel geschrieben wurde. **Kapitel 1** gibt eine ausführliche Darstellung der Motivation sowie des Ziels welches mit der Bachelorarbeit verfolgt wird. **Kapitel 2** Erläutert und Untersucht die Aspekte der Performance Evaluation Mobiler Anwendungen, vorhandene Technologie und die zu Evaluierende Anwendung GEMO **Kapitel 3** Beginnt mit der Einführung in die Implementierung der Evaluation und Präzisiert dazu den Prozess der Erhebung Laufzeitrelevanter Daten  **Kapitel 4** zeigt wie phasellus gravida non ex id aliquet. Proin faucibus nibh sit amet augue blandit varius.
-->

# Zusammenfassung {.unnumbered}

Die Brunata-Metrona-Gruppe (Brunata) ermittelt als Dienstleister die Heizungs- und Warmwasserkosten der Nutzer am Ende eines 12-monatigen Zeitraums, damit die gesetzlichen Abrechnungen von Vermieter oder Verwalter erstellt werden können. Gegenwärtig werden mit einer Android-App (Gemo) die Zählerstände von altgeräten erfasst sowie der Einbau und die Wartung von Geräten vorgenommen, allerdings können bei der Benutzung der App Leistungsprobleme, wie lange Ladezeiten, auftreten. Solche Probleme werden momentan nur durch Meldungem und anschließender Untersuchung der Logdaten durch einen Entwickler behandelt. Da dieser Prozess sehr aufwendig ist und nicht alle Probleme erkennt, soll in dieser Arbeit ein Verfahren entwickelt und implementiert werden, welches die Leistung einer App evaluiert, beziehungsweise die Leistungsdaten aus den Logdaten extrahiert und grafisch aufbereitet. Es wurden die Verfahren maschinelles Lernen, Data Mining und Text Mining zur Analyse der Daten miteinander verglichen. Text Mining wurde hierzu im Analyseprozess verwendet. Zur Extraktion der benötigten Zeit von Prozessen und Anfragen aus den Logdaten, wird die verteilte Such- und Analysesoftware Elasticsearch verwendet. Die Logdaten werden mit einem Grok Pattern vorverarbeitet und in verschiedene Felder strukturiert. Zusätzlich werden mit Runtimefields in Elasticsearch die Zeitwerte und der Prozess oder Anfrage Name aus den Feldern extrahiert. Die extrahierten Daten werden mit der Open-Source-Analyse- und Visualisierungsplattform Kibana in einem Dashboard mit unterschiedlichen Graphen aufbereitet. Die Graphen sind in der Lage, die auf einen Zeitraum betrachtete mediale, sowie maximal benötigte Zeit von Prozess und Anfrage wiederzugeben. Damit verbessert das implementierte Verfahren die Erkennung von Leistungsproblemen, sowie ihre Behandlung.
<!--
Dafür wurde zur Extraktion der benötigten Zeit von Prozessen und Anfragen aus logdaten ein Analyseprozess angewendet. 
Dafür wurde die benötigte Zeit von Prozessen und Anfragen aus den Logdaten Extrahiert und Grafisch aufbereitet. 
Dafür wurde die Extraktion und Aufbereitung von Leistungsdaten aus Logdaten der App mithilfe eines Analyseprozess geplant. Die benötigte Zeit von Prozessen und Anfragen diente als 

<!-- Zählerwerte werden nur von alten Geräte erfasst moderne Funken das von selbst.
Meldung Monteur und danach Entwickler bearbeitung
<!--
Dafür wurde zur Extraktion der benötigten Zeit von Prozessen und Anfragen aus logdaten ein Analyseprozess angewendet.
Dafür wurde die benötigte Zeit von Prozessen und Anfragen aus den Logdaten Extrahiert und Grafisch aufbereitet.
Dafür wurde die Extraktion und Aufbereitung von Leistungsdaten aus Logdaten der App mithilfe eines Analyseprozess geplant. Die benötigte Zeit von Prozessen und Anfragen diente als

Das Ziel der vorliegenden Arbeit ist es unerkannte Leistungsprobleme in Mobilen Anwendungen erkennen und beheben zu können. Dazu wird die Folgende Forschungsfrage gestellt Wie kann ein Verfahren implementiert werden um die Leistung einer Mobilen Anwendung zu Evaluieren?

Das Ziel der vorliegenden Arbeit ist es zu beantworten, wie man die Performance Mobiler Anwendungen Evaluieren kann. Dazu wird die Folgende Forschungsfrage gestellt: Wie kann man
-->

\pagenumbering{roman}
\setcounter{page}{1}

\newpage

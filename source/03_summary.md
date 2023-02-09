# Zusammenfassung {.unnumbered}

Von der Brunata-Metrona-Gruppe (Brunata) werden als Dienstleister die Heizungs- und Warmwasserkosten der Nutzer am Ende eines zwölfmonatigen Zeitraums ermittelt, damit die gesetzlich vorgeschriebenen Abrechnungen von Vermieter oder Verwalter erstellt werden können. Gegenwärtig werden mit einer Android-App (Gemo) die Zählerstände von Altgeräten erfasst sowie der Einbau und die Wartung von Geräten vorgenommen, allerdings können bei der Benutzung der App Leistungsprobleme wie lange Ladezeiten auftreten. Solche Komplikationen werden momentan nur durch Meldungen und eine anschließende Untersuchung der Logdaten durch einen Entwickler behandelt. \

Da dieser Prozess aufwändig ist und nicht alle Probleme in ihm erkannt werden, soll in der vorliegenden Arbeit ein Verfahren entwickelt und implementiert werden, mit dem die Leistung einer App evaluiert wird beziehungsweise die Leistungsdaten aus den Logdaten extrahiert und grafisch aufbereitet werden. \

Hierfür wurden die Datenanalyseverfahren maschinelles Lernen, Data-Mining und Text-Mining verglichen. Text-Mining wurde dabei im Analyseprozess verwendet. Zur Extraktion der für Prozesse und Anfragen aus den Logdaten benötigten Zeit wurde die verteilte Such- und Analysesoftware Elasticsearch verwendet. Die Logdaten wurden mit einem Grok-Pattern vorverarbeitet und in verschiedene Felder strukturiert. Zusätzlich wurden mit Runtimefields in Elasticsearch die Zeitwerte und der Prozess oder der Anfragename aus den Feldern extrahiert. Die extrahierten Daten wurden mit der Open-Source-Analyse- und Visualisierungsplattform Kibana in einem Dashboard mit unterschiedlichen Graphen aufbereitet. Letztere sind dafür geeignet, die auf einen Zeitraum betrachtete mediale sowie maximal benötigte Zeit von Prozess und Anfrage wiederzugeben. Damit verbessert das implementierte Verfahren die Erkennung sowie die Behandlung von Leistungsproblemen.
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

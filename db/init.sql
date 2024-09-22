-- Erstellen der Datenbank ROLLOUT
CREATE DATABASE IF NOT EXISTS ROLLOUT;
USE ROLLOUT;

CREATE USER admin IDENTIFIED BY 'password';
    
-- Erstellen der Tabelle MITARBEITER
CREATE TABLE IF NOT EXISTS MITARBEITER (
    Mitarbeiter_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    Mitarbeiter_Vorname VARCHAR(50) NOT NULL,
    Mitarbeiter_Name VARCHAR(50) NOT NULL,
    Mitarbeiter_Rolle VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS USER (
    user_ID INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'USER',
    Mitarbeiter_ID INT,
    FOREIGN KEY (Mitarbeiter_ID) REFERENCES MITARBEITER(Mitarbeiter_ID) ON DELETE CASCADE
);



-- Erstellen der Tabelle KUNDE
CREATE TABLE IF NOT EXISTS KUNDE (
    Kunde_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Kunde_Marktnummer VARCHAR(50) NOT NULL,
    Kunde_Strasse VARCHAR(100) NOT NULL,
    Kunde_Hausnummer VARCHAR(10) NOT NULL,
    Kunde_PLZ VARCHAR(10) NOT NULL,
    Kunde_Ort VARCHAR(100) NOT NULL
);

-- Erstellen der Tabelle AUFTRAG
CREATE TABLE IF NOT EXISTS AUFTRAG (
    Auftrag_ID INT PRIMARY KEY AUTO_INCREMENT,
    Kunde_ID INT,
    Mitarbeiter_ID INT,
    Status VARCHAR(100) NOT NULL,
    KW VARCHAR(10) NOT NULL,
    Installation_geplant DATE,
    Installation_Tag DATE,
    Abbruchdatum DATE,
    Kabeltausch_erledigt BOOLEAN DEFAULT FALSE,
    Problemfall BOOLEAN DEFAULT FALSE,
    Abschluss_Techniker BOOLEAN DEFAULT FALSE,
    Abschluss_Buero BOOLEAN DEFAULT FALSE,
    Unterschrift_Kunde VARCHAR(255),
    Unterschrift_Techniker VARCHAR(255),
    FOREIGN KEY (Kunde_ID) REFERENCES KUNDE(Kunde_ID) ON DELETE SET NULL,
    FOREIGN KEY (Mitarbeiter_ID) REFERENCES MITARBEITER(Mitarbeiter_ID) ON DELETE SET NULL
);

-- Erstellen der Tabelle PAKET
CREATE TABLE IF NOT EXISTS PAKET (
    Paket_ID INT PRIMARY KEY AUTO_INCREMENT,
    Kunde_ID INT,
    Status VARCHAR(100) NOT NULL,
    FOREIGN KEY (Kunde_ID) REFERENCES KUNDE(Kunde_ID) ON DELETE SET NULL
);

-- Erstellen der Tabelle GERAET
CREATE TABLE IF NOT EXISTS GERAET (
    Geraet_ID INT PRIMARY KEY AUTO_INCREMENT,
    Kunde_ID INT,
    Typ VARCHAR(100) NOT NULL,
    Status VARCHAR(100) NOT NULL,
    FOREIGN KEY (Kunde_ID) REFERENCES KUNDE(Kunde_ID) ON DELETE SET NULL
);

-- Erstellen der Tabelle ROUTE
CREATE TABLE IF NOT EXISTS ROUTE (
    Route_ID INT PRIMARY KEY AUTO_INCREMENT,
    Mitarbeiter_ID INT,
    Auftrag_ID INT,
    Installation_Tag DATE NOT NULL,
    FOREIGN KEY (Mitarbeiter_ID) REFERENCES MITARBEITER(Mitarbeiter_ID) ON DELETE SET NULL,
    FOREIGN KEY (Auftrag_ID) REFERENCES AUFTRAG(Auftrag_ID) ON DELETE CASCADE
);

-- Erstellen der Tabelle KOMMENTAR
CREATE TABLE IF NOT EXISTS KOMMENTAR (
    Kommentar_ID INT PRIMARY KEY AUTO_INCREMENT,
    Auftrag_ID INT,
    Problemfall_Kommentar TEXT NOT NULL,
    Kommentar_Datum DATE NOT NULL,
    FOREIGN KEY (Auftrag_ID) REFERENCES AUFTRAG(Auftrag_ID) ON DELETE CASCADE
);

INSERT INTO MITARBEITER (Mitarbeiter_Vorname, Mitarbeiter_Name, Mitarbeiter_Rolle)
VALUES 
('Max', 'Mustermann', 'Techniker'),
('Anna', 'Müller', 'Techniker'),
('John', 'Doe', 'Teamleiter'),
('Sarah', 'Schmidt', 'Büromitarbeiter'),
('Peter', 'Parker', 'Techniker');

INSERT INTO KUNDE (Kunde_Marktnummer, Kunde_Strasse, Kunde_Hausnummer, Kunde_PLZ, Kunde_Ort)
VALUES
('MN123', 'Hauptstrasse', '1', '12345', 'Berlin'),
('MN124', 'Nebenstrasse', '12', '54321', 'Hamburg'),
('MN125', 'Marktplatz', '45', '98765', 'München'),
('MN126', 'Ringstrasse', '9', '65432', 'Stuttgart'),
('MN127', 'Schlossallee', '99', '11111', 'Köln');

INSERT INTO AUFTRAG (Kunde_ID, Mitarbeiter_ID, Status, KW, Installation_geplant, Installation_Tag, Abbruchdatum, Kabeltausch_erledigt, Problemfall, Abschluss_Techniker, Abschluss_Buero, Unterschrift_Kunde, Unterschrift_Techniker)
VALUES
(1, 1, 'Offen', 'KW40', '2023-10-01', '2023-10-02', NULL, FALSE, FALSE, FALSE, FALSE, 'Kunde1_Sig.png', 'Techniker1_Sig.png'),
(2, 2, 'Abgeschlossen', 'KW41', '2023-10-03', '2023-10-04', NULL, TRUE, FALSE, TRUE, TRUE, 'Kunde2_Sig.png', 'Techniker2_Sig.png'),
(3, 3, 'Offen', 'KW42', '2023-10-05', '2023-10-06', NULL, FALSE, TRUE, FALSE, FALSE, 'Kunde3_Sig.png', 'Techniker3_Sig.png'),
(4, 1, 'In Bearbeitung', 'KW43', '2023-10-07', '2023-10-08', NULL, TRUE, TRUE, FALSE, FALSE, 'Kunde4_Sig.png', 'Techniker1_Sig.png'),
(5, 2, 'Abgebrochen', 'KW44', '2023-10-09', NULL, '2023-10-10', FALSE, TRUE, FALSE, FALSE, 'Kunde5_Sig.png', NULL);

INSERT INTO PAKET (Kunde_ID, Status)
VALUES
(1, 'Gesendet'),
(2, 'Empfangen'),
(3, 'Verarbeitet'),
(4, 'Verzögert'),
(5, 'Abgeschlossen');

INSERT INTO GERAET (Kunde_ID, Typ, Status)
VALUES
(1, 'Modem', 'Aktiv'),
(2, 'Router', 'Inaktiv'),
(3, 'Switch', 'Aktiv'),
(4, 'Modem', 'Defekt'),
(5, 'Router', 'Aktiv');

INSERT INTO ROUTE (Mitarbeiter_ID, Auftrag_ID, Installation_Tag)
VALUES
(1, 1, '2023-10-02'),
(2, 2, '2023-10-04'),
(3, 3, '2023-10-06'),
(1, 4, '2023-10-08'),
(2, 5, '2023-10-09');

INSERT INTO KOMMENTAR (Auftrag_ID, Problemfall_Kommentar, Kommentar_Datum)
VALUES
(3, 'Kabelprobleme bei der Installation.', '2023-10-06'),
(4, 'Techniker verspätet, Problem mit der Netzverbindung.', '2023-10-08'),
(5, 'Auftrag wurde abgebrochen wegen Kundenanfrage.', '2023-10-10');

INSERT INTO USER (username, password, role)
VALUES
('admin', '9a7c42240b95330f5d04c3e416317e528e65d7b966c7722b3935eca4c0dca219', 'ADMIN'),
('johndoe', '01J85MBNSAKWNWEJ781BCM2J2V', 'USER'),
('janedoe', '01J85MC8VD914A6NFS672N1Q44', 'ADMIN'),
('kamil', '01J85HDMYMYSCNVQH5C14ZN9SS', 'USER'),
('raoule', '01J85HDMYMYSCNVQH5C14ZN9SS', 'USER');

INSERT INTO MITARBEITER (Mitarbeiter_Vorname, Mitarbeiter_Name, Mitarbeiter_Rolle, Mitarbeiter_ID) 
VALUES 
('Laura', 'Becker', 'Techniker', '1'),
('Markus', 'Schneider', 'Teamleiter', '2'),
('Julia', 'Fischer', 'Büromitarbeiter', '3'),
('Thomas', 'Weber', 'Techniker', '4'),
('Sophie', 'Meyer', 'Büromitarbeiter', '5'),
('Lukas', 'Wagner', 'Techniker', '6'),
('Emma', 'Beck', 'Teamleiter', '7'),
('Felix', 'Hoffmann', 'Techniker', '8'),
('Mia', 'Richter', 'Büromitarbeiter', '9'),
('Leon', 'Klein', 'Techniker', '10'),
('Lena', 'Wolf', 'Büromitarbeiter', '11'),
('Nico', 'Schröder', 'Techniker', '12'),
('Hannah', 'Neumann', 'Teamleiter', '13'),
('Jan', 'Schulz', 'Techniker', '14'),
('Lisa', 'Hartmann', 'Büromitarbeiter', '15'),
('Kevin', 'Zimmermann', 'Techniker', '16'),
('Marie', 'Braun', 'Büromitarbeiter', '17'),
('Tim', 'Koch', 'Techniker', '18'),
('Nina', 'Richter', 'Teamleiter', '19'),
('Paul', 'Kaiser', 'Techniker', '20'),
('Clara', 'Walter', 'Büromitarbeiter', '21');

INSERT INTO USER (username, password, role, Mitarbeiter_ID)
VALUES
('laura.becker', 'passwort123', 'Techniker', 1),
('markus.schneider', 'passwort123', 'Teamleiter', 2),
('julia.fischer', 'passwort123', 'Büromitarbeiter', 3),
('thomas.weber', 'passwort123', 'Techniker', 4),
('sophie.meyer', 'passwort123', 'Büromitarbeiter', 5),
('lukas.wagner', 'passwort123', 'Techniker',6 ),
('emma.beck', 'passwort123', 'Teamleiter', 7),
('felix.hoffmann', 'passwort123', 'Techniker', 8),
('mia.richter', 'passwort123', 'Büromitarbeiter', 9),
('leon.klein', 'passwort123', 'Techniker', 10),
('lena.wolf', 'passwort123', 'Büromitarbeiter', 11),
('nico.schroeder', 'passwort123', 'Techniker', 12),
('hannah.neumann', 'passwort123', 'Teamleiter', 13),
('jan.schulz', 'passwort123', 'Techniker', 14),
('lisa.hartmann', 'passwort123', 'Büromitarbeiter', 15),
('kevin.zimmermann', 'passwort123', 'Techniker', 16),
('marie.braun', 'passwort123', 'Büromitarbeiter', 17),
('tim.koch', 'passwort123', 'Techniker', 18),
('nina.richter', 'passwort123', 'Teamleiter', 19),
('paul.kaiser', 'passwort123', 'Techniker', 20),
('clara.walter', 'passwort123', 'Büromitarbeiter', 21);

INSERT INTO KOMMENTAR (Auftrag_ID, Problemfall_Kommentar, Kommentar_Datum)
VALUES
(26, 'Problem mit der Installation des Geräts.', '2024-09-01 10:15:00'),
(27, 'Kunde nicht zu Hause angetroffen.', '2024-09-02 09:30:00'),
(28, 'Kabeltausch notwendig, Auftrag verzögert.', '2024-09-03 14:45:00'),
(29, 'Zusätzliche Materialien benötigt.', '2024-09-04 11:00:00'),
(30, 'Gerät defekt, Ersatzteil wird benötigt.', '2024-09-05 13:20:00'),
(6, 'Fehlerhafte Adresse, Termin muss neu geplant werden.', '2024-09-06 15:10:00'),
(7, 'Techniker hat den Auftrag abgeschlossen, jedoch Unterschrift fehlt.', '2024-09-07 08:30:00'),
(8, 'Verbindung zum Internet konnte nicht hergestellt werden.', '2024-09-08 12:45:00'),
(9, 'Unvorhergesehene Probleme bei der Installation.', '2024-09-09 10:15:00'),
(10, 'Kunde wünscht eine Änderung im Auftrag.', '2024-09-10 16:00:00'),
(11, 'Probleme mit der Signalstärke, Techniker schickt Verstärker.', '2024-09-11 09:20:00'),
(12, 'Kunde hat falsches Gerät erhalten, Umtausch erforderlich.', '2024-09-12 14:35:00'),
(13, 'Wetterbedingt wurde der Außeneinsatz verschoben.', '2024-09-13 17:50:00'),
(14, 'Verzögerung durch fehlende Genehmigung von der Hausverwaltung.', '2024-09-14 11:30:00'),
(15, 'Fehler im Auftrag, erneut planen.', '2024-09-15 10:45:00'),
(16, 'Techniker musste wegen Krankheit den Termin absagen.', '2024-09-16 13:15:00'),
(17, 'Kabel wurde beschädigt, Austausch erforderlich.', '2024-09-17 08:40:00'),
(18, 'Unzureichende Vorbereitungen im Vorfeld des Termins.', '2024-09-18 12:10:00'),
(19, 'Techniker konnte den Fehler nicht finden, weitere Analyse notwendig.', '2024-09-19 15:25:00'),
(20, 'Problem mit der Software, neue Version muss installiert werden.', '2024-09-20 09:55:00'),
(21, 'Falscher Auftrag, Kunde hat andere Dienstleistung angefordert.', '2024-09-21 14:05:00'),
(22, 'Gerät funktioniert nicht ordnungsgemäß, Austausch geplant.', '2024-09-22 13:40:00'),
(23, 'Kunde hat den Auftrag storniert.', '2024-09-23 16:30:00'),
(24, 'Fehler bei der Netzwerkkonfiguration.', '2024-09-24 11:20:00'),
(25, 'Auftrag wurde erfolgreich abgeschlossen, jedoch Dokumentation fehlt.', '2024-09-25 10:00:00');

INSERT INTO AUFTRAG (Auftrag_ID,Kunde_ID, Mitarbeiter_ID, Status, KW, Installation_geplant, Installation_Tag, Abbruchdatum, Kabeltausch_erledigt, Problemfall, Abschluss_Techniker, Abschluss_Buero, Unterschrift_Kunde, Unterschrift_Techniker)
VALUES
(FK Kunde_ID, 2, 'In Bearbeitung', 'KW38', '2024-09-01', '2024-09-05', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID, 3, 'Abgeschlossen', 'KW39', '2024-09-02', '2024-09-07', NULL, true, false, true, true, 'John Doe', 'Max Mustermann'),
(FK Kunde_ID, 4, 'In Bearbeitung', 'KW40', '2024-09-03', '2024-09-09', NULL, false, true, false, false, NULL, NULL),
(FK Kunde_ID, 1, 'Abgebrochen', 'KW41', '2024-09-04', '2024-09-10', '2024-09-12', false, true, false, false, NULL, NULL),
(FK Kunde_ID, 5, 'In Bearbeitung', 'KW42', '2024-09-05', '2024-09-15', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID 2, 'Abgeschlossen', 'KW43', '2024-09-06', '2024-09-17', NULL, true, false, true, true, 'Anna Müller', 'Peter Parker'),
(FK Kunde_ID 3, 'Abgebrochen', 'KW44', '2024-09-07', '2024-09-20', '2024-09-21', false, true, false, false, NULL, NULL),
(FK Kunde_ID 4, 'In Bearbeitung', 'KW45', '2024-09-08', '2024-09-22', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID 5, 'Abgeschlossen', 'KW46', '2024-09-09', '2024-09-24', NULL, true, false, true, true, 'Peter Parker', 'Sarah Schmidt'),
(FK Kunde_ID, 2, 'Abgebrochen', 'KW47', '2024-09-10', '2024-09-25', '2024-09-26', false, true, false, false, NULL, NULL),
(FK Kunde_ID, 3, 'In Bearbeitung', 'KW48', '2024-09-11', '2024-09-28', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID, 4, 'Abgeschlossen', 'KW49', '2024-09-12', '2024-09-30', NULL, true, false, true, true, 'Sarah Schmidt', 'Max Mustermann'),
(FK Kunde_ID, 5, 'Abgebrochen', 'KW50', '2024-09-13', '2024-10-01', '2024-10-02', false, true, false, false, NULL, NULL),
(FK Kunde_ID, 2, 'In Bearbeitung', 'KW51', '2024-09-14', '2024-10-03', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID, 3, 'Abgeschlossen', 'KW52', '2024-09-15', '2024-10-05', NULL, true, false, true, true, 'John Doe', 'Anna Müller'),
(FK Kunde_ID, 4, 'Abgebrochen', 'KW53', '2024-09-16', '2024-10-07', '2024-10-08', false, true, false, false, NULL, NULL),
(FK Kunde_ID, 5, 'In Bearbeitung', 'KW01', '2024-09-17', '2024-10-10', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID, 2, 'Abgeschlossen', 'KW02', '2024-09-18', '2024-10-12', NULL, true, false, true, true, 'Max Mustermann', 'John Doe'),
(FK Kunde_ID, 3, 'In Bearbeitung', 'KW03', '2024-09-19', '2024-10-14', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID, 4, 'Abgebrochen', 'KW04', '2024-09-20', '2024-10-16', '2024-10-17', false, true, false, false, NULL, NULL),
(FK Kunde_ID, 5, 'In Bearbeitung', 'KW05', '2024-09-21', '2024-10-18', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID, 2, 'Abgeschlossen', 'KW06', '2024-09-22', '2024-10-20', NULL, true, false, true, true, 'Peter Parker', 'Anna Müller'),
(FK Kunde_ID, 3, 'In Bearbeitung', 'KW07', '2024-09-23', '2024-10-22', NULL, false, false, false, false, NULL, NULL),
(FK Kunde_ID, 4, 'Abgeschlossen', 'KW08', '2024-09-24', '2024-10-24', NULL, true, false, true, true, 'Sarah Schmidt', 'Max Mustermann'),
(FK Kunde_ID, 5, 'Abgebrochen', 'KW09', '2024-09-25', '2024-10-26', '2024-10-27', false, true, false, false, NULL, NULL);


INSERT INTO USER (username, password, role)
VALUES
('max.mustermann', 'passwort123', 'ADMIN'),
('anna.mueller', 'passwort123', 'USER'),
('john.doe', 'passwort123', 'TEAMLEAD'),
('sarah.schmidt', 'passwort123', 'USER'),
('peter.parker', 'passwort123', 'USER'),
('peter.becker', 'passwort123', 'USER'),
('markus.schneider', 'passwort123', 'TEAMLEAD'),
('julia.fischer', 'passwort123', 'USER'),
('thomas.weber', 'passwort123', 'USER'),
('sophie.meyer', 'passwort123', 'USER'),
('lukas.wagner', 'passwort123', 'USER'),
('emma.beck', 'passwort123', 'TEAMLEAD'),
('felix.hoffmann', 'passwort123', 'USER'),
('mia.richter', 'passwort123', 'USER'),
('leon.klein', 'passwort123', 'USER'),
('lena.wolf', 'passwort123', 'USER'),
('nico.schroeder', 'passwort123', 'USER'),
('hannah.neumann', 'passwort123', 'TEAMLEAD'),
('jan.schulz', 'passwort123', 'USER'),
('lisa.hartmann', 'passwort123', 'USER'),
('kevin.zimmermann', 'passwort123', 'USER'),
('marie.braun', 'passwort123', 'USER'),
('tim.koch', 'passwort123', 'USER'),
('nina.richter', 'passwort123', 'TEAMLEAD'),
('paul.kaiser', 'passwort123', 'USER');

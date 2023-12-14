-- Client
-- Atribute: ID_Client (cheie primara), Nume_Client, Adresa_Client, Email_Client, Telefon_Client

-- Entitate: BuchetFlori
-- Atribute: ID_Buchet (cheie primara), Nume_Buchet, Descriere, Pret, Disponibilitate

-- Entitate: Comanda
-- Atribute: ID_Comanda (cheie primara), ID_Client (cheie externa referentiata la Client), ID_Buchet (cheie externa referentiata la BuchetFlori), Data_Comanda, Status_Comanda

-- Entitate: Livrator
-- Atribute: ID_Livrator (cheie primara), Nume_Livrator, Telefon_Livrator, Disponibilitate

-- Relatie: Livrare
-- Atribute: ID_Livrare (cheie primara), ID_Comanda (cheie externa referentiata la Comanda), ID_Livrator (cheie externa referentiata la Livrator), Data_Livrare, Status_Livrare

-- ------------------------------------------------------------- --
-- Client - Comanda:
-- Relatie: 1-n.
-- Un client poate plasa mai multe comenzi, dar o comandă este plasata de un singur client.

-- BuchetFlori - Comanda:
-- Relatie: 1-n .
-- Un buchet de flori poate fi inclus intr-o singura comanda, dar o comanda poate contine mai multe buchete de flori.

-- Comanda - Livrare:
-- Relatie: 1-1.
-- O comanda este asociata unei singure livrari, iar o livrare este asociata cu o singura comanda.

-- Livrare - Livrator:
-- Relatie: 1-n.
-- O livrare este asociata cu un singur livrator, iar un livrator este asociat cu una sau mai multe livrari.

CREATE TABLE Client (
    ID_Client INT PRIMARY KEY,
    Nume_Client VARCHAR(255) NOT NULL,
    Adresa_Client VARCHAR(255)  NOT NULL,
    Email_Client VARCHAR(255) NOT NULL,
    Telefon_Client VARCHAR(15) NOT NULL
);

CREATE TABLE BuchetFlori (
    ID_Buchet INT PRIMARY KEY,
    Nume_Buchet VARCHAR(255) NOT NULL,
    Descriere TEXT,
    Pret DECIMAL(10, 2)  NOT NULL, 
    Disponibilitate BOOLEAN  NOT NULL
);

CREATE TABLE Comanda (
    ID_Comanda INT PRIMARY KEY,
    ID_Client INT NOT NULL,
    ID_Buchet INT NOT NULL,
    Data_Comanda DATE NOT NULL,
    Status_Comanda VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_Client) REFERENCES Client(ID_Client),
    FOREIGN KEY (ID_Buchet) REFERENCES BuchetFlori(ID_Buchet)
);

CREATE TABLE Livrator (
    ID_Livrator INT PRIMARY KEY,
    Nume_Livrator VARCHAR(255) NOT NULL,
    Telefon_Livrator VARCHAR(15) NOT NULL,
    Disponibilitate BOOLEAN NOT NULL
);

CREATE TABLE Livrare (
    ID_Livrare INT PRIMARY KEY,
    ID_Comanda INT NOT NULL,
    ID_Livrator INT NOT NULL,
    Data_Livrare DATETIME NOT NULL,
    Status_Livrare VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_Comanda) REFERENCES Comanda(ID_Comanda),
    FOREIGN KEY (ID_Livrator) REFERENCES Livrator(ID_Livrator)
);

-- Forma normala 3 implica eliminarea dependentelor tranzitive si asigurarea ca fiecare atribut non-cheie este dependent doar de cheia primara a tabelului.
-- In cazul de mai sus, toate tabelele au fost create astfel incat sa respecte forma normala 3. 
-- Cheile primare sunt bine definite, nu exista dependente tranzitive, iar relatiile dintre tabele sunt gestionate prin chei straine. 
-- De asemenea, tipurile de date ale atributelor sunt potrivite pentru informatiile stocate în fiecare tabel.
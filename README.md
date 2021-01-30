# progetto-clup-1-gruppo-clup-1
Prerequisiti
-Java jdk versione 11
-Eclipse IDE v2020-09
-Apache Tomcat v9.0 o maggiore
-Maven v3.6.3
-MySql versione 8.0

Database
Il DBMS utilizzato è mySQL. Nel repository git è presente il folder database contenente tutti gli script da eseguire per creare e popolare il database. Sono presenti gli script per la creazione dello user, dello schema da eseguire prima degli script per la creare e popolare le tabelle 

Avvio applicazione
L'applicazione deve essere avviata tramite Eclipse:
Dal repository di git scaricare lo zip dell’ultima release o clonare la cartella tramite git clone e importare il progetto in Eclipse. Dalla barra di navigazione di Eclipse selezionare Windows -> Show View -> Other -> Server -> Servers. Si aprirà la view dei server. Se non sono presenti server cliccare sul link per aggiungere il server, altrimenti tasto destro -> New -> Server. Scegliere apache tomcat 9.0 e aggiungergli il progetto importato precedentemente. Infine per avviare l’applicazione tasto destro sul progetto -> Run As -> Run on server.

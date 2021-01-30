<!-- ABOUT THE PROJECT -->
# Customer Line Up 
## Abstract

Customer Line Up nasce per aiutare le persone a saltare la coda nei vari negozi, supermercati, ristoranti e bar.
Con l’avvento dell’emergenza da Covid-19, sono state introdotte regole rigide per evitare assembramenti, così da ridurre il contagio. 
I negozi si sono adoperati affinché all’interno delle proprie strutture non si creassero situazioni di rischio, ma il problema non è stato debellato definitivamente. 
Infatti, il rischio maggiore lo si corre con le code che si creano fuori dagli store. 
Proprio per questo, Customer Line Up rappresenta la soluzione per evitare ogni possibile situazione di rischio. 
Si possono prenotare gli ingressi, visualizzare la prenotazione successiva, visualizzare gli storici e vedere quale negozio ha più slot liberi, così da evitare di aspettare inutilmente fuori dai negozio. 
Inoltre, è data la possibilità ai manager di visualizzare le prenotazioni, gestirle tramite cancellazione e modifica, e di modificare il numero di slot disponibili.


### Tecnologie di sviluppo
Questa sezione contiente tutte le informazioni necessarie per installare l'applicazione, oltre a fornire le tecnologie utilizzate per lo sviluppo.
* [Bootstrap](https://getbootstrap.com)
* [JQuery](https://jquery.com)
* [Java](https://www.java.com/it/)



<!-- GETTING STARTED -->
## Getting Started

Di seguito sono riportate le istruzioni per effetuare l'installazione del progetto in locale.

### Prerequisites

Questa sezione contiente la lista dei software da installare per eseguire l'applicazione
* Eclipse IDE for Enterprise Java Developers - 2020-09
* Apache-tomcat-9.0.41
* Maven 3.6.3
* Java (jdk 11)
* MySQL

### Database
Nel repository è presente la cartella database che contiene gli script per creare e popolare il database
In ordine sono da eseguire:

1. Mysql_user.sql per la creazione dello user
2. SchemaDb.sql per la creazione dello schema
3. I restanti script nella folder data per popolare il database

### Installation

1. Clona il repository
   ```sh
   git clone https://github.com/UnimibSoftEngCourse2021/progetto-clup-1-gruppo-clup-1.git
   ```
1. Apri Eclipse IDE for Enterprise Java Developers - 2020-09 
   
2. Effettuare le seguenti operazioni
   ```
   File - Import- Projects from git -  Clone URI;
   ```
3. Per creare il server
   ```
   Window - Show View - Other - Server - Servers;
   ```
4. Per eseguire l'applicazione 
   ```
   Tasto destro - Run As - Run on Server - Selezionare il server 
   ```
5. Dal browser preferito collegarsi su:
   ```
   http://localhost:8080/clup/
   ```
<!-- USAGE EXAMPLES -->
## Utilizzo
Collegandosi all'url riportato in precedeza, è possibile registrarsi nel sistema e una volta effettuata tale operazione, loggarsi per poter prenotare il proprio posto in un negozio.
La prenotazione viene effettuata scegliendo la data, l'ora ed eventualmente le categorie di interesse.




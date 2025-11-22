Répertoire de travail roa : iray code source du framework, iray code de test ho anleh framework.
Ny **code source** anleh framework tsy maintsy anaty git.

Ny **PR** tsy maintsy atao à temps foana. 


### Exo
Mamorona FrontServlet dia avadika  .jar ilay izy.
Manao projet Test dia atao ao anaty lib an'ilay Test ilay framework (ilay .jar) 
Ao @ ilay Test no mi-configurer anleh web.xml hoe FrontServlet ity no chemin ( / )
Deployer-na avy eo ilay izy dia ny url rehetra tokony makao amleh Servlet

### SPRINT 2
Creation d'annotation qui prend en param un URL. Il faut le tester d'abord dans un main avant de l'utiliser.

### SPRINT 2-BIS
Creation d'annotation au niveau classe 

### SPRINT 3
Manao code mijery hoe misy controller antsika ve ilay izy dia jerena hoe ananantsika ve ilay url dia averina ilay classe sy methode associe @ ilay url.

### SPRINT 4
Executer-na ilay methode
Raha String ilay valeur de retour dia afficher-na fotsiny ilay izy

### SPRINT 4-BIS
Anaty framework : creer classe ModelView asina attribut hoe String view.
Anaty Test : anaty controller zany mety manana methode mi retourne ModelView. 
dia ao amleh methode zany hoe misy hoe :
ModelView mv = new ModelView ();
mv.setView('test.jsp');

dia tokony miverina any am test.jsp izany

IZANY HOE raha type String ilay izy dia afficher-na am PrintWriter ilay izy. 
raha type ModelView ilay izy dia alefa anaty dispatcher ilay view izany


### SPRINT 5
Creer attribut ao am ModelView hoe data (atao Map)
Cle : nom model, valeur : Object
Mandefa donnees avy aty @ controller makany @ vue

### SPRINT 3-BIS
Determination anleh hoe /etudiant/{id} dia tokony hay ilay methode
Raha misy requete url hoe http://localhost:8080/etudiant/17 zany dia tokony hay hoe iza ilay methode 

### SPRINT 6
exemple : insert-etudiant

url : /etudiant/save

EtudiantController : 
Url("/etudiant/save") 
get (int id, String nom) {
	ilay id sy nom dia name anleh input any amleh formulaire
}

any am JSP zany misy formulaire (na method GET na POST tokony mety foana) dia misy input ohatra hoe  input text dia name="nom" de misy koa hoe input number dia name="id"

dia ilay id sy nom tsy maintsy mitovy amleh argument anleh fonction (io ambony io ilay fonction) dia aveo soloina zany ny valeur anleh id sy nom (en argument) atao anleh valeur anleh input tatsy amlay formulaire.

### SPRINT 6-BIS
Mamorona annotation @RequestParam izay String value ny attribut-ny
Dia amzay fotooana zay afaka atao tsy mitovy ilay args anleh methode sy ilay formulaire satria ao amleh RequestParam no atao mitovy. 
ohatra hoe 
public String get (@RequestParam("id") int idEtudiant, @RequestParam("nom") String nom)
ilay argument afaka atao hafa zany fa ilay anaty RequestParam tsy maintsy mitovy

### SPRINT 6-TER
Raha misy /etudiant/{id} dia tokony fantarina amzay ilay valeur anleh {id} dia ampiasaina ao amlay methode amzay 

Url("/etudiant/{id}") (dynamique ilay valeur id)
get (int id) {
	tokony hita ato zany ilay id io
} 

### SPRINT 7
Manampy @GetMapping sy @PostMapping
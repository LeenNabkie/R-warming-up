##########################################################################################
##########################################################################################


# 1. Type de sujet 
##########################################################################################

## 1.1. Les vecteurs: une liste d'éléments qui sont tous de même type
##########################################################################################

### 1.1.1. creer un Les vecteur:

v1= c(1,2,3,4,5)
v2=1:5
v3=rep(10:12,c(2,5,3)) 
v4=rep(c("A","B","C"),each=3)

class(v1)
class(v2)
class(v3)
class(v4)

v4
### 1.1.2. Acceder aux elements d'un vecteur
v1[3]
v1[v1>2]
v4[c(2,3)]
v5=v4[-c(1:3)]



### 1.1.3. operations sur les vecteurs
v6=v1+v2
v7=v1*v2
v8=v1/v2
v9=v1-5


##########################################################################################

## 1.2. Les facteurs: contiennent des éléments qualitatifs. Les facteurs contiennent des éléments qui font référence à des niveaux ou des catégories. Pouvent contenir des éléments de types différents.
##########################################################################################

### 1.2.1. creer un Les facteur:

f1=factor(rep(200:202,c(2,3,1)))
f2=as.factor(c("jean","jeremy","jean","jack"))
f3=factor(v4)

levels(f1)
levels(f2)
levels(f3)

nlevels(f1)


my.factor<-factor(x=c("n1","n1","n3","n1","n2"),levels=c("n1","n2","n3","n4"),labels=c("niveau 1","niveau 2","niveau 3","niveau 4"))
my.factor
### 1.2.2. conversation vecteur~facteur


v10=as.numeric(as.character(f1))


summary(f3)
summary(v4)
summary(v10)
summary(f1)

##########################################################################################

## 1.3. Les Matrices
##########################################################################################

### 1.3.1. creer un matrice:

m1=matrix(2001:2020,nrow=4,byrow=T)

### 1.3.2. Acceder aux elements d'un matrice:
m1[2,3]
m1[m1>2005]
m2=m1[-2,]
m3=m1[,-3]

### 1.3.3. manipulation d'une matrice:
m4=rbind(m1,m1)
m5=cbind(m2,m2)


##########################################################################################

## 1.4. data frames : une sorte de matrice, mais plus flexibles, surtout parce que les éléments d'une ligne peuvent etre differents.
##########################################################################################

### 1.4.1. creer un data frame:
df1=data.frame(m1)




setwd("C:/VOTRE CHEMIN COMPLET") 
setwd("C:/Users/gita/Desktop/HEC_COURS/ZCH21/ATL2021/BD")

getwd()

data_etudiants_notes=read.table("data_etudiants_notes_rev2.txt",header=T,sep ="\t")

data_etudiants_socio=read.csv("data_etudiants_socio_rev2.csv",header=T,sep =",")

df2=data.frame(data_etudiants_notes,data_etudiants_socio)




### 1.4.2. acceder a un element d'un data frame:

df2$Nom
df2[,1]

df2[df2$Nom=="Jimmy Jackson"| df2$Age==20,c(1,10)]
df2[which(df2$Nom=="Jimmy Jackson"| df2$Age==20),c(1,10)]
subset(df2,Nom=="Jimmy Jackson"| Age==20)

df2[1,]

head(df2,10) # 10 premiers lignes de df2
tail(df2,10) # 10 derniers lignes de df2
df2[1:10,] # 10 premiers lignes de df2
df2[50:65,] 

### 1.4.3. manipuler un data frame

#### 1.4.3.1 general

summary(df2)   # resumer statistiques des donnees de df2
str(df2)


mean(df2$Age)
max(df2$Note_Francais)
min(df2$Note_Anglais)
sum(df2$Note_Histoire)/nrow(df2)


##### manipuler des colonnes
colnames(df1)=c("year1","year2","year3","year4","year5")  #changer le nom des colonnes de df1
names(df1)

names(df1)[3]="annee3" # changer le nom de collonne 3 de "years3" a "annee3"
names(df1)

df9=df1[-c(2:4)]      # enlever les colonnes 2 et 4 de df1
df9$X1=NULL           # enlever la colonne x1 de df1
df1$year10=2000:2003  # ajouter un colonne avec le nom "year10"

#### 1.4.3.2 donnees manquantes

df3=data.frame(ID=c(1:8),Name=c("mina","neline","Nicolas","claud",NA,"jeremy","",NA),Age=rep(36:39,c(2)),Salery=c(2000,100000,NA,300,25000,0,NA,1000000))
is.na(df3$Name)
is.na(df3$Salery)


sum(is.na(df3)) #compter les donnees manquants de df3
sum(is.na(df3$Salery))

#### 1.4.3.3. jointure:

df4=data.frame(ID=c(1,3,5,7,2,4,6,8),maried=c(0,1,1,1,0,1,0,0))
df5=cbind(df3,df4)

df6=merge(df3,df4,by="ID")
help(merge)  # se consulter sur la fonction "merge"

##### c'est quoi la difference entre 2 fonctions? quelle est la meiux?

df7 = data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df8 = data.frame(CustomerId = c(2, 4, 8), State = c(rep("Alabama", 2), rep("Ohio", 1)))


merge(x = df7, y = df8, by = "CustomerId", all = TRUE)          # full join

merge(x = df7, y = df8, by = "CustomerId", all.x = TRUE)        # left join

merge(x = df7, y = df8, by = "CustomerId", all.y = TRUE)        # right join

merge(x = df7, y = df8)                                         # inner join

##### 1.4.3.4. aggreger les donnees
aggregate(df3$Salery,by=list(df3$Age),FUN="mean")
aggregate(df2[,2:6],by=list(df2$Sexe,df2$Provenance),FUN="mean")




##### 1.4.3.5. ordonner les donnees
order(df4$maried)
sort(df4$maried)

#Ordonner un data.frame
df4[order(df4$maried),] 

##### 1.4.3.6. Echantillonnage aleatoire
sample_etudiants=data_etudiants_socio[sample(1:nrow(data_etudiants_socio), 50,replace=FALSE),]



##########################################################################################

## 1.5. listes: réfèrent un ensemble d'éléments ou objets, qui peuvent être de types différents.
##########################################################################################

### 1.5.1. créer une liste:
l1=list(v1,f1,m1,df1)

### 1.5.2. accéder a un element d'une matrice:
l1[[1]]
l1[[1]][1]
l1[[2]]
l1[[2]][3]
l1[[3]]
l1[[3]][m1>2005]
l1[[3]][2,3]
l1[[4]]
l1[[4]][4,4]

names(l1)
annee=m1

l2=list(element1=v1,element2=f1,annee=m1,data_etudient=df2)
names(l2)

#### Note:la sortie de certaines fonctions de R est un objet liste parce que c'est un objet flexible:
x=1:1000
y=10+3*x+rnorm(1000) # Crée un jeu de données 
reg_lin=lm(y~x) # Ajuste une régression linéaire 
summary(reg_lin) 
names(reg_lin) 
reg_lin$residuals 
reg_lin$coeff

##########################################################################################

# 2. importer les donnes #
data_etudiants_socio= read.csv(choose.files(),header= TRUE, sep=",")
data_etudiants_notes=read.table(choose.files(),header=T,sep ="\t")

# ou bien:
setwd("C:/VOTRE CHEMIN COMPLET") 
getwd()

data_etudiants_socio=read.csv("data_etudiants_socio_rev2.csv",header=T,sep =",", fileEncoding="UTF-8-BOM")
data_etudiants_notes=read.table("data_etudiants_notes_rev2.txt",header=T,sep ="\t")


data_etudiants=merge(data_etudiants_socio,data_etudiants_notes,by.x="Nom",by.y="Nom")
##########################################################################################

# 3. Exporter les donnees#
t1=head(data_etudiants_socio,10)

write.csv(t1,file="t1.csv",row.names = TRUE)


##########################################################################################

# 4. quelques codes utiles:
rm()                                    # pour effacer un objet dans R
help(nom_de_la_commande)                # pour consulter sur une fonction R


##########################################################################################

# 5. créer des fonctions:
##########################################################################################

## input: il faut préciser quelles variables seront utilisées
## output: c'est la dernière ligne de la fonction, sauf si l'énoncé return() est utilisé


## 1. Nous voulons créer une fonction qui calculera l'étendue de n'importe quel vecteur de données.
etendue=function(x){ max(x)-min(x)}

v11=c(55,96,41,52,105,45,111,52)
etendue(v11)

## 2. Un professeur décide de créer une fonction permettant de calculer  le pourcentage de personnes qui ont échoué à l'examen de math 
#    ( une note inférieure à 60 indique l'échec dans la matière).
pct_echec_fct= function(data_x)
{ 
  pct_echec= nrow(data_x[data_x$Note_Math<60,])/nrow(data_x) 
  print(paste("Pourcentage d'échec est de : ", pct_echec*100,"%"))
}

pct_echec_fct(data_etudiants_notes)

## 3.Que va effectuer la commande suivante?


ajustement_passage=function(x){
  x$passage=NA
  table_temp=x[x$Provenance!="Canada",]
  table_temp$passage=ifelse(table_temp$Note_Math>80 & table_temp$Note_Anglais>80,"oui","non")
  x[x$Provenance!="Canada",]<-table_temp
  x
}
data_etudiants_new=ajustement_passage(df2) 


##########################################################################################

# 6. Boucles:
##########################################################################################
## Quand on veut repeter la meme commands pendant pleusieurs iteration.
## Exemple: si on vous demande d'importer les 10 tables de données à votre disposition (qui ont une syntaxe de nom similaire), 
#           vous devez répéter l'opération 10 fois. Cela n'est pas vraiment optimisé.

## 6.1. Boucle avec la clause "FOR":

### Syntaxe: for (i in -:-) {do.....}

### Exemple 1: Nous voulons afficher le carré  des nombres allant de 1 à 12. Alors on aura la commande suivante:
for(i in 1:12) {print (i^2)}


### Exemple 2:Nous désirons créer une nouvelle variable Agegroup1. Cette nouvelle variable qui sera à l'intérieur 
#             de la table data_etudiants aura pour valeur "Moins de 35 ans" lorsque l'étudiant aura moins de 35 ans et la valeur "Plus de 35 ans" lorsque l'étudiant aura plus de 35 ans.
#### Solution avec ifelse:

for (i in 1:nrow(data_etudiants)){
  data_etudiants$G_AGE2=ifelse(data_etudiants$Age<35,"Moins de 35 ans","Plus de 35 ans")
}

#### Solution avec if:
for (i in 1:nrow(data_etudiants)){
  if( data_etudiants$Age[i]<35){
    data_etudiants$Agegroup1[i]<-"Moins de 35 ans" }
  if(data_etudiants$Age[i]>=35){data_etudiants$Agegroup1[i]<-"Plus de 35 ans"}
}


## 6.2. Boucle avec la clause "WHILE":

### Syntaxe: x=_  while(x<_){do.....}
### La boucle WHILE va effectuer un ensemble de commandes/fonctions (qui seront compris dans les accolades) jusqu'à ce que la condition définie au préalable ne soit plus valable

### Exemple 1: Nous voulons afficher les 20 premiers chiffres de la suite 2,4,6,. Alors la requête sera:
x=0
while(x<21){x=x+1; print(2*x) }

### Exemple 2:Dans le cas où nous ne voulons pas afficher les nombres multiples de 3 alors on peut utiliser la commande suivante:
x=0
while(x<21){x=x+1; if(x%%3==0) next; print(2*x) }

##########################################################################################

# 7. Les commandes de type APPLY 
##########################################################################################
## Ils permettent de faire des boucles for en se basant sur un objet afin d'appliquer des fonctions bien définies. Nous verrons ici 3 types de commandes apply.

#apply
m1 <- matrix(c(rep(1,each=6),rep(2:10,each=6)),nrow=5, ncol=6,byrow=T)
m1

#Apply par ligne
apply(m1[2:5,], 1, sum)

for(i in 2:5){
  print(sum(m1[i,]))
  
}

#Apply par colonne
apply(m1, 2, sum)

#Apply par cellule
apply(m1, c(1,2), function(x){x*2})

#lapply - sapply
lapply(m1, FUN=function(x){return(x*2)})
sapply(m1, FUN=function(x){return(x*2)})

matrix(lapply(m1, FUN=function(x){return(x*2)}),nrow=5, ncol=6,byrow=F)
matrix(sapply(m1, FUN=function(x){return(x*2)}),nrow=5, ncol=6,byrow=F)

#lapply
movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies
movies_lower <-lapply(movies, tolower)
str(movies_lower)

movies_lower <-unlist(lapply(movies,tolower))
str(movies_lower)

#autre exemple
dt <- cars
head(dt)
lmn_cars <- lapply(dt, min)
smn_cars <- sapply(dt, min,simplify = T)
lmn_cars
smn_cars


## 7.1. Apply:

### Synthese: apply ( nom de matrice ou datafarame, Margine : egale a 1 ca veut dire fairela fonction ligne par linge et si c'est egale a 2 par colonne , Fun=)
### Exemple: Nous travaillons avec la donnée du fichier data_etudiants et nous voulons dans un premier temps savoir quelles sont les variables qui sont de type numérique.Ensunous allons déterminer l'étendue de chacune de ces variables. Puis la note maximale de chaque élève.ite


var_num_log=sapply(data_etudiants,is.numeric)

Etudiant_etendue=apply(data_etudiants[, var_num_log] ,2,etendue)

apply(data_etudiants[, var_num_log] ,2,max)

## 7.2. Lapply:
### C'est une commande qui va retourner une liste de la même longueur que l'objet x qui sera l'intrant du LAPPLY.
### Exemple: Exemple: Nous voulons créer une nouvelle table de données qui comprendra le nom de l'élève, le minimum entre la note de français et la note de math et une variable binaire qui prendra pour valeur 1 si l'élève a eu plus de 50 dans son cours de physique, 0 sinon. La commande LAPPLY est une belle solution pour ce genre de question. Définissons notre fonction:

names(data_etudiants)[1]="Nom" 
data_etudiants$Nom<-as.character(data_etudiants$Nom)
Fct_min_physique=function(x){
  
  Min_notes=min(data_etudiants[data_etudiants$Nom==x,]$Note_Math,data_etudiants[data_etudiants$Nom==x,]$Note_Francais)
  Physique_50=ifelse(data_etudiants[data_etudiants$Nom==x,]$Note_Physique>50,1,0)
  
  return(data.frame(Nom=x, Physique_50=Physique_50, Min_notes=Min_notes))
}

liste_nom=c("Wayne Patterson","Whitney French","William Hall","Willie Rivera","Wilma Gonzales","Yvonne Love")
Data_min_phy_etudiants=lapply(liste_nom, Fct_min_physique)

Data_min_phy_etudiant=do.call(rbind,lapply(liste_nom, Fct_min_physique))

help("do.call")



## 7.3. Sapply:
###La commande sapply est une commande qui marche exactement comme la commande lapply.
#  La seule différence est que cette commande va retourner un vecteur, une matrice ou bien un tableau bien approprié.

mina=sapply(1:3, function(x) x^2)


## tapply
data(iris)
head(iris)
str(iris)
levels(iris$Species)

tapply(iris$Sepal.Width, iris$Species, median)

#Equivalent à
aggregate(Sepal.Width~Species,data=iris,FUN=median)

## mapply
word <- function(C, k=2,sep='') paste(rep.int(C, k), collapse = sep)

mapply(word, LETTERS[1:6], 6:1, SIMPLIFY = T) #Essayer SIMPLIFY=T
mapply(word, LETTERS[1:6], 6:1,MoreArgs=list('-'), SIMPLIFY = T)
mapply(word, LETTERS[1:6], 6:1,as.character(1:6), SIMPLIFY = T)

##########################################################################################

# 8. Graphique
##########################################################################################

#Quelques Graphiques de base

#Boxplot 
boxplot(data_etudiants$Note_Francais)
#Boxplot Par groupe
boxplot(Note_Francais~Sexe,data=data_etudiants) 

#Histogram
hist(data_etudiants$Note_Francais)

#plot
#Changer le type de Annee en date
data_etudiants$date<-as.Date(paste0('01-',as.character(data_etudiants$Annee)),format='%d-%b-%y')

lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
data_etudiants$date<-as.Date(paste0('01-',as.character(data_etudiants$Annee)),format='%d-%b-%y')

#Ordonner les données par date
data_etudiants<-data_etudiants[order(data_etudiants$date),]
#Aggreger les données par date
data_etudiants.agg<-aggregate(x=data_etudiants$Frais_de_scolarite,by=list(data_etudiants$date),FUN=mean)
#Afficher le graphiquee
plot(data_etudiants.agg$Group.1,data_etudiants.agg$x,type='b',col='purple') 

#Graphique en bas par Sexe
data_etudiants_agg<-aggregate(Age ~ Sexe, data = data_etudiants,FUN=function(x){return(length(x)/nrow(data_etudiants))})
barplot((Age*100) ~ Sexe, data = data_etudiants_agg)


#Correlation and nuage de point (scatter plots)
data_etudiants$Bourse=as.integer(data_etudiants$Bourse)
data_etudiants_num<-data_etudiants[,names(data_etudiants)[sapply(data_etudiants,is.numeric)]]
cor(data_etudiants_num)

#nuage de point: x=Frais_de_scolarite,y=Note_Histoire
plot(data_etudiants$Frais_de_scolarite,data_etudiants$Note_Histoire)
#Afficher la ligne  droite de la régression linéaire
abline(lm(Note_Histoire~Frais_de_scolarite,data=data_etudiants),col='red')

plot(data_etudiants$Note_Francais,data_etudiants$Note_Histoire)
abline(lm(Note_Histoire~Note_Francais,data=data_etudiants),col='red')

#par(mfrow=c(2,3)): permet de diviser l'image en2 lignes et 3 colonnes pour afficher plusieurs graphiques
par(mfrow=c(2,4))

#Boucle par colonne 1
for (c1 in colnames(data_etudiants_num)){
  #Boucle par colonne 2
  for (c2 in colnames(data_etudiants_num)){
    if(c1!=c2){ #On ne veut pas affichier le graphique si les colonnes c1 et c2 sont les mêmes
      
      #Afficher nuage de point
      plot(data_etudiants[,c1],data_etudiants[,c2]
           ,xlab=c1, ylab=c2)
      
      abline(lm(paste0(c2,'~',c1),data=data_etudiants),col='red')
      
    }
  }
  mtext(c1,side = 3, line = -2, outer = TRUE)
}
#par(mfrow=c(1,1)): permet de réinitialiser l'image en (1,1) pour a suite
par(mfrow=c(1,1))

### ggplot2  ###

#install.packages('ggplot2')

library(ggplot2)

g1=ggplot(data_etudiants, aes(x = Sexe)) +
  geom_bar(aes(y = (stat(count))/sum(stat(count)))) +
  ggtitle('Graph1 ') +
  labs(subtitle="sub title 1") + 
  scale_y_continuous(labels = scales::percent, name = "Proportion(%)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme_bw()


#afficher g1
print(g1)

#Équivalent en utilisant stat(prop)
ggplot(data_etudiants, aes(x = Sexe)) +
  geom_bar(aes(y = stat(prop), group = 1)) +
  ggtitle('Graph3') +
  scale_y_continuous(labels = scales::percent, name = "Proportion") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme_bw()


#Histogram
ggplot(data_etudiants, aes(Note_Francais)) +
  geom_histogram(aes(y = stat(count)),bins=40)




#Exploration ggplot2: nuage de point (scatter plot)
ggplot(data = data_etudiants_num) + 
  geom_point(mapping = aes(x = Frais_de_scolarite, y = Note_Histoire)) +
  ggtitle('Scatter plot')


ggplot(data = data_etudiants) + 
  geom_point(mapping = aes(x = Frais_de_scolarite, y = Note_Histoire,color=Sexe)) +
  ggtitle('Scatter plot')

ggplot(data = data_etudiants) + 
  geom_point(mapping = aes(x = Frais_de_scolarite, y = Note_Histoire,color=Provenance)) +
  ggtitle('Scatter plot')


#Ajout taille par Age
ggplot(data = data_etudiants) + 
  geom_point(mapping = aes(x = Frais_de_scolarite, y = Note_Histoire,color=Provenance,size=Age)) +
  
  ggtitle('Scatter plot')

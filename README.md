#Mini RNVP FR

/!\ Projet just for fun du Samedi soir ! /!\

##Abstract

```
((HEADER NOM|SOCIETE|CHEZ...) (NUM (RUE|VOIE|BD...)) (CP (VILLE)(PAYS)))
```

##Exemple :

```
*Hrnvp T> restrAdr  $ C8.pack "alex,andre lambda; chez angel 8, rue des lapins 92320 chatillin"
Adresse {l1 = "ALEXANDRE LAMBDA ", l2 = "CHEZ ANGEL ", l3 = "8 RUE DES LAPINS ", l4 = "", l5 = "", l6 = "92320 CHATILLIN", l7 = ""}
```

```
echo "Jean-Alexandre Dupond chez angel 88 rue des lapins 92320 chatillon" | ./myrnvp 
l1 :JEAN-ALEXANDRE DUPOND 
l2 : ANGEL 
l5 :88 RUE DES LAPINS 
l6 :92320 CHATILLON
```

```
echo "Jean-Alexandre Dupond 88 rue des lapins 92320 chatillon" | ./myrnvp 
l1 :JEAN-ALEXANDRE DUPOND 
l5 :88 RUE DES LAPINS 
l6 :92320 CHATILLON
```

```
https://rnvp.ifup.sh/Alex22%20rue%20des%20lapins%2075407%20Paris
```

Ce qui [donne](https://rnvp.ifup.sh/Alex22%20rue%20des%20lapins%2075407%20Paris)

##TODO 

- Passer en ByteString car là, c'est vraiment trop moche !
- Utilisation de Data.Tree pour plus de fun
- Ajout de la ligne 7
- Notion d'entreprise/bat pour ligne 2
- Voir si pas mieux avec un Parsec ?
- Revoir l'algo autours du pivot qui est un peut "lourd"

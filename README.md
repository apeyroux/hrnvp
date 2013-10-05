#Mini RNVP en Haskell

/!\ Projet just for fun du Samedi soir !

##Exemple :

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

ogrinfo -ro -al -fields=YES -geom=SUMMARY RESEAU_ROUTIER_NIV1.shp  | grep "^  NOM (String)" | sed "s/ NOM (String) =//g" | sed "s/^  //g" > /tmp/listrue.txt
ogrinfo -ro -al -fields=YES -geom=SUMMARY RESEAU_ROUTIER_NIV2.shp  | grep "^  NOM (String)" | sed "s/ NOM (String) =//g" | sed "s/^  //g" >> /tmp/listrue.txt
ogrinfo -ro -al -fields=YES -geom=SUMMARY RESEAU_ROUTIER_NIV3.shp  | grep "^  NOM (String)" | sed "s/ NOM (String) =//g" | sed "s/^  //g" >> /tmp/listrue.txt
ogrinfo -ro -al -fields=YES -geom=SUMMARY RESEAU_ROUTIER_NIV4.shp  | grep "^  NOM (String)" | sed "s/ NOM (String) =//g" | sed "s/^  //g" >> /tmp/listrue.txt
ogrinfo -ro -al -fields=YES -geom=SUMMARY RESEAU_ROUTIER_NIV5.shp  | grep "^  NOM (String)" | sed "s/ NOM (String) =//g" | sed "s/^  //g" >> /tmp/listrue.txt

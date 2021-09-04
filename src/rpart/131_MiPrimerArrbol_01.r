#Arbol elemental con libreria  rpart
require("data.table")
require("rpart")
require("rpart.plot")
setwd("C:/Users/facun/Documents/ITBA/Cursadas/03 - Data Mining") 
#cargo los datos
dataset  <- fread("./datasetsOri/paquete_premium_202011.csv")

dataset[clase_ternaria != "BAJA+2", clase_Dolores := "MALA"]
dataset[clase_ternaria == "BAJA+2", clase_Dolores := "BUENA"]

# generacion del modelo
modelo2  <- rpart("clase_Dolores ~ . -clase_ternaria",  
                  data = dataset, 
                  cp= -1,
                  maxdepth= 8
                  )

#impresion elaborada del arbol
jpeg(file ="./work/MiPrimerArbol_03.jpg",  width = 6, height = 4, units = 'in', res = 300)
prp(modelo2, extra=101, digits=5, branch=1, type=4, varlen=0, faclen=0)
dev.off()

# Es util el arbol que salió ?
# Que ganancia tiene cada hoja de ese arbol ?
#Necesita para correr en Google Cloud
#64 GB de memoria RAM
#256 GB de espacio en el disco local
#8 vCPU


#limpio la memoria
rm( list=ls() )
gc()

library( "data.table" )


setwd( "~/buckets/b1/" )
#lectura rapida del dataset  usando fread  de la libreria  data.table
dataset <- fread( "./datasetsOri/paquete_premium.csv.gz")


#acomodo los errores del dataset
dataset[ foto_mes==201801,  internet   := NA ]
dataset[ foto_mes==201801,  cprestamos_personales   := NA ]
dataset[ foto_mes==201801,  mprestamos_personales   := NA ]
dataset[ foto_mes==201801,  mprestamos_hipotecarios  := NA ]
dataset[ foto_mes==201801,  tcallcenter   := NA ]
dataset[ foto_mes==201801,  ccallcenter_transacciones   := NA ]
dataset[ foto_mes==201801,  thomebanking   := NA ]
dataset[ foto_mes==201801,  chomebanking_transacciones   := NA ]
dataset[ foto_mes==201801,  ccajas_transacciones   := NA ]
dataset[ foto_mes==201801,  ccajas_consultas   := NA ]
dataset[ foto_mes==201801,  ccajas_depositos   := NA ]
dataset[ foto_mes==201801,  ccajas_extracciones   := NA ]
dataset[ foto_mes==201801,  ccajas_otras   := NA ]

dataset[ foto_mes==201904,  ctarjeta_visa_debitos_automaticos  :=  NA ]
dataset[ foto_mes==201904,  mttarjeta_visa_debitos_automaticos := NA ]

dataset[ foto_mes==201905,  mrentabilidad     := NA ]
dataset[ foto_mes==201905,  mrentabilidad_annual     := NA ]
dataset[ foto_mes==201905,  mcomisiones      := NA ]
dataset[ foto_mes==201905,  ccomisiones_otras := NA ]
dataset[ foto_mes==201905,  mcomisiones_otras := NA ]

dataset[ foto_mes==201910,  mpasivos_margen   := NA ]
dataset[ foto_mes==201910,  mactivos_margen   := NA ]
dataset[ foto_mes==201910,  ccajeros_propios_descuentos := NA ]
dataset[ foto_mes==201910,  mcajeros_propios_descuentos := NA ]
dataset[ foto_mes==201910,  ctarjeta_visa_descuentos    := NA ]
dataset[ foto_mes==201910,  ctarjeta_master_descuentos  := NA ]
dataset[ foto_mes==201910,  mtarjeta_visa_descuentos    := NA ]
dataset[ foto_mes==201910,  mtarjeta_master_descuentos  := NA ]
dataset[ foto_mes==201910,  ccomisiones_otras := NA ]
dataset[ foto_mes==201910,  mcomisiones_otras := NA ]
dataset[ foto_mes==201910,  mrentabilidad     := NA ]
dataset[ foto_mes==201910,  mrentabilidad_annual        := NA ]
dataset[ foto_mes==201910,  chomebanking_transacciones  := NA ]

dataset[ foto_mes==202002,  ccajeros_propios_descuentos   := NA ]
dataset[ foto_mes==202002,  mcajeros_propios_descuentos   := NA ]
dataset[ foto_mes==202002,  ctarjeta_visa_descuentos   := NA ]
dataset[ foto_mes==202002,  mtarjeta_visa_descuentos   := NA ]
dataset[ foto_mes==202002,  ctarjeta_master_descuentos   := NA ]
dataset[ foto_mes==202002,  mtarjeta_master_descuentos   := NA ]

dataset[ foto_mes==202006,  active_quarter   := NA ]
dataset[ foto_mes==202006,  internet   := NA ]
dataset[ foto_mes==202006,  mrentabilidad   := NA ]
dataset[ foto_mes==202006,  mrentabilidad_annual   := NA ]
dataset[ foto_mes==202006,  mcomisiones   := NA ]
dataset[ foto_mes==202006,  mactivos_margen   := NA ]
dataset[ foto_mes==202006,  mpasivos_margen   := NA ]
dataset[ foto_mes==202006,  mcuentas_saldo   := NA ]
dataset[ foto_mes==202006,  ctarjeta_debito_transacciones   := NA ]
dataset[ foto_mes==202006,  mautoservicio   := NA ]
dataset[ foto_mes==202006,  ctarjeta_visa_transacciones   := NA ]
dataset[ foto_mes==202006,  mtarjeta_visa_consumo   := NA ]
dataset[ foto_mes==202006,  ctarjeta_master_transacciones   := NA ]
dataset[ foto_mes==202006,  mtarjeta_master_consumo   := NA ]
dataset[ foto_mes==202006,  ccomisiones_otras   := NA ]
dataset[ foto_mes==202006,  mcomisiones_otras   := NA ]
dataset[ foto_mes==202006,  cextraccion_autoservicio   := NA ]
dataset[ foto_mes==202006,  mextraccion_autoservicio   := NA ]
dataset[ foto_mes==202006,  ccheques_depositados   := NA ]
dataset[ foto_mes==202006,  mcheques_depositados   := NA ]
dataset[ foto_mes==202006,  ccheques_emitidos   := NA ]
dataset[ foto_mes==202006,  mcheques_emitidos   := NA ]
dataset[ foto_mes==202006,  ccheques_depositados_rechazados   := NA ]
dataset[ foto_mes==202006,  mcheques_depositados_rechazados   := NA ]
dataset[ foto_mes==202006,  ccheques_emitidos_rechazados   := NA ]
dataset[ foto_mes==202006,  mcheques_emitidos_rechazados   := NA ]
dataset[ foto_mes==202006,  tcallcenter   := NA ]
dataset[ foto_mes==202006,  ccallcenter_transacciones   := NA ]
dataset[ foto_mes==202006,  thomebanking   := NA ]
dataset[ foto_mes==202006,  chomebanking_transacciones   := NA ]
dataset[ foto_mes==202006,  ccajas_transacciones   := NA ]
dataset[ foto_mes==202006,  ccajas_consultas   := NA ]
dataset[ foto_mes==202006,  ccajas_depositos   := NA ]
dataset[ foto_mes==202006,  ccajas_extracciones   := NA ]
dataset[ foto_mes==202006,  ccajas_otras   := NA ]
dataset[ foto_mes==202006,  catm_trx   := NA ]
dataset[ foto_mes==202006,  matm   := NA ]
dataset[ foto_mes==202006,  catm_trx_other   := NA ]
dataset[ foto_mes==202006,  matm_other   := NA ]
dataset[ foto_mes==202006,  ctrx_quarter   := NA ]
dataset[ foto_mes==202006,  tmobile_app   := NA ]
dataset[ foto_mes==202006,  cmobile_app_trx   := NA ]

dataset[ foto_mes==202009,  ccajeros_propios_descuentos   := NA ]
dataset[ foto_mes==202009,  mcajeros_propios_descuentos   := NA ]
dataset[ foto_mes==202009,  ctarjeta_visa_descuentos      := NA ]
dataset[ foto_mes==202009,  mtarjeta_visa_descuentos   := NA ]
dataset[ foto_mes==202009,  ctarjeta_master_descuentos   := NA ]
dataset[ foto_mes==202009,  mtarjeta_master_descuentos   := NA ]

dataset[ foto_mes==202010,  internet  := NA ]
dataset[ foto_mes==202010,  ccajeros_propios_descuentos  := NA ]
dataset[ foto_mes==202010,  mcajeros_propios_descuentos  := NA ]
dataset[ foto_mes==202010,  ctarjeta_visa_descuentos  := NA ]
dataset[ foto_mes==202010,  mtarjeta_visa_descuentos  := NA ]
dataset[ foto_mes==202010,  ctarjeta_master_descuentos  := NA ]
dataset[ foto_mes==202010,  mtarjeta_master_descuentos  := NA ]

dataset[ foto_mes==202011,  internet  := NA ]
dataset[ foto_mes==202012,  internet  := NA ]
dataset[ foto_mes==202101,  internet  := NA ]

dataset[ foto_mes==202009,  tmobile_app  := NA ]
dataset[ foto_mes==202010,  tmobile_app  := NA ]
dataset[ foto_mes==202011,  tmobile_app  := NA ]
dataset[ foto_mes==202012,  tmobile_app  := NA ]
dataset[ foto_mes==202101,  tmobile_app  := NA ]

dataset[ foto_mes==202009,  cmobile_app_trx  := NA ]
dataset[ foto_mes==202010,  cmobile_app_trx  := NA ]
dataset[ foto_mes==202011,  cmobile_app_trx  := NA ]
dataset[ foto_mes==202012,  cmobile_app_trx  := NA ]
dataset[ foto_mes==202101,  cmobile_app_trx  := NA ]

# La financiación límite de Master en 201904 este mes está 5 veces más arriba que el resto
dataset[ foto_mes==201904, Master_mfinanciacion_limite := Master_mfinanciacion_limite / 5]

# Saco estas variables del juego porque prácticamente son nula siempre
dataset[ , Master_Finiciomora := NA ]
dataset[ , Visa_Finiciomora   := NA ]

#Comienza la creacion de variables

columnas_originales <-  copy(colnames( dataset ))

#INICIO de la seccion donde se deben hacer cambios con variables nuevas
#se crean los nuevos campos para MasterCard  y Visa, teniendo en cuenta los NA's

# Arreglo algunos NA con el promedio de cada columna
dataset[is.na(dataset$Visa_mpagosdolares), Visa_mpagosdolares := mean(dataset[, Visa_mpagosdolares], na.rm = T)]
dataset[is.na(dataset$Visa_cconsumos), Visa_cconsumos := ceiling(mean(dataset[, Visa_cconsumos], na.rm = T))]
dataset[is.na(dataset$Visa_mconsumospesos), Visa_mconsumospesos := mean(dataset[, Visa_mconsumospesos], na.rm = T)]
dataset[is.na(dataset$Visa_madelantopesos), Visa_madelantopesos := mean(dataset[, Visa_madelantopesos], na.rm = T)]
dataset[is.na(dataset$Visa_cadelantosefectivo), Visa_cadelantosefectivo := ceiling(mean(dataset[, Visa_cadelantosefectivo], na.rm = T))]
dataset[is.na(dataset$Visa_mconsumosdolares), Visa_mconsumosdolares := mean(dataset[, Visa_mconsumosdolares], na.rm = T)]
dataset[is.na(dataset$Visa_madelantodolares), Visa_madelantodolares := mean(dataset[, Visa_madelantodolares], na.rm = T)]
dataset[is.na(dataset$Visa_mconsumototal), Visa_mconsumototal := mean(dataset[, Visa_mconsumototal], na.rm = T)]
dataset[is.na(dataset$Master_fultimo_cierre), Master_fultimo_cierre := ceiling(mean(dataset[, Master_fultimo_cierre], na.rm = T))]
dataset[is.na(dataset$Master_mfinanciacion_limite), Master_mfinanciacion_limite := mean(dataset[, Master_mfinanciacion_limite], na.rm = T)]
dataset[is.na(dataset$Master_msaldototal), Master_msaldototal := mean(dataset[, Master_msaldototal], na.rm = T)]
dataset[is.na(dataset$Master_mpagado), Master_mpagado := mean(dataset[, Master_mpagado], na.rm = T)]
dataset[is.na(dataset$Master_fechaalta), Master_fechaalta := ceiling(mean(dataset[, Master_fechaalta], na.rm = T))]
dataset[is.na(dataset$Master_delinquency), Master_delinquency := ceiling(mean(dataset[, Master_delinquency], na.rm = T))]
dataset[is.na(dataset$Master_Fvencimiento), Master_Fvencimiento := ceiling(mean(dataset[, Master_Fvencimiento], na.rm = T))]
dataset[is.na(dataset$Master_msaldopesos), Master_msaldopesos := mean(dataset[, Master_msaldopesos], na.rm = T)]
dataset[is.na(dataset$Master_mpagominimo), Master_mpagominimo := mean(dataset[, Master_mpagominimo], na.rm = T)]
dataset[is.na(dataset$Master_status), Master_status := ceiling(mean(dataset[, Master_status], na.rm = T))]
dataset[is.na(dataset$Master_msaldodolares), Master_msaldodolares := mean(dataset[, Master_msaldodolares], na.rm = T)]
dataset[is.na(dataset$Master_mlimitecompra), Master_mlimitecompra := mean(dataset[, Master_mlimitecompra], na.rm = T)]
dataset[is.na(dataset$Visa_fultimo_cierre), Visa_fultimo_cierre := ceiling(mean(dataset[, Visa_fultimo_cierre], na.rm = T))]
dataset[is.na(dataset$Visa_status), Visa_status := ceiling(mean(dataset[, Visa_status], na.rm = T))]
dataset[is.na(dataset$Visa_msaldodolares), Visa_msaldodolares := mean(dataset[, Visa_msaldodolares], na.rm = T)]
dataset[is.na(dataset$Visa_mlimitecompra), Visa_mlimitecompra := mean(dataset[, Visa_mlimitecompra], na.rm = T)]
dataset[is.na(dataset$Visa_mfinanciacion_limite), Visa_mfinanciacion_limite := mean(dataset[, Visa_mfinanciacion_limite], na.rm = T)]
dataset[is.na(dataset$Visa_msaldototal), Visa_msaldototal := mean(dataset[, Visa_msaldototal], na.rm = T)]
dataset[is.na(dataset$Visa_mpagado), Visa_mpagado := mean(dataset[, Visa_mpagado], na.rm = T)]
dataset[is.na(dataset$Visa_fechaalta), Visa_fechaalta := ceiling(mean(dataset[, Visa_fechaalta], na.rm = T))]
dataset[is.na(dataset$Visa_delinquency), Visa_delinquency := ceiling(mean(dataset[, Visa_delinquency], na.rm = T))]
dataset[is.na(dataset$Visa_Fvencimiento), Visa_Fvencimiento := ceiling(mean(dataset[, Visa_Fvencimiento], na.rm = T))]
dataset[is.na(dataset$Visa_msaldopesos), Visa_msaldopesos := mean(dataset[, Visa_msaldopesos], na.rm = T)]
dataset[is.na(dataset$Visa_mpagominimo), Visa_mpagominimo := mean(dataset[, Visa_mpagominimo], na.rm = T)]

#varias formas de combinar Visa_status y Master_status
dataset[ , mv_status01       := pmax( Master_status,  Visa_status, na.rm = TRUE) ]
dataset[ , mv_status02       := Master_status +  Visa_status ]
dataset[ , mv_status03       := pmax( ifelse( is.na(Master_status), 10, Master_status) , ifelse( is.na(Visa_status), 10, Visa_status) ) ]
dataset[ , mv_status04       := ifelse( is.na(Master_status), 10, Master_status)  +  ifelse( is.na(Visa_status), 10, Visa_status)  ]
dataset[ , mv_status05       := ifelse( is.na(Master_status), 10, Master_status)  +  100*ifelse( is.na(Visa_status), 10, Visa_status)  ]

dataset[ , mv_status06       := ifelse( is.na(Visa_status), 
                                        ifelse( is.na(Master_status), 10, Master_status), 
                                        Visa_status)  ]

dataset[ , mv_status07       := ifelse( is.na(Master_status), 
                                        ifelse( is.na(Visa_status), 10, Visa_status), 
                                        Master_status)  ]


#combino MasterCard y Visa
dataset[ , mv_mfinanciacion_limite := rowSums( cbind( Master_mfinanciacion_limite,  Visa_mfinanciacion_limite) , na.rm=TRUE ) ]

dataset[ , mv_Fvencimiento         := pmin( Master_Fvencimiento, Visa_Fvencimiento, na.rm = TRUE) ]
dataset[ , mv_Finiciomora          := pmin( Master_Finiciomora, Visa_Finiciomora, na.rm = TRUE) ]
dataset[ , mv_msaldototal          := rowSums( cbind( Master_msaldototal,  Visa_msaldototal) , na.rm=TRUE ) ]
dataset[ , mv_msaldopesos          := rowSums( cbind( Master_msaldopesos,  Visa_msaldopesos) , na.rm=TRUE ) ]
dataset[ , mv_msaldodolares        := rowSums( cbind( Master_msaldodolares,  Visa_msaldodolares) , na.rm=TRUE ) ]
dataset[ , mv_mconsumospesos       := rowSums( cbind( Master_mconsumospesos,  Visa_mconsumospesos) , na.rm=TRUE ) ]
dataset[ , mv_mconsumosdolares     := rowSums( cbind( Master_mconsumosdolares,  Visa_mconsumosdolares) , na.rm=TRUE ) ]
dataset[ , mv_mlimitecompra        := rowSums( cbind( Master_mlimitecompra,  Visa_mlimitecompra) , na.rm=TRUE ) ]
dataset[ , mv_madelantopesos       := rowSums( cbind( Master_madelantopesos,  Visa_madelantopesos) , na.rm=TRUE ) ]
dataset[ , mv_madelantodolares     := rowSums( cbind( Master_madelantodolares,  Visa_madelantodolares) , na.rm=TRUE ) ]
dataset[ , mv_fultimo_cierre       := pmax( Master_fultimo_cierre, Visa_fultimo_cierre, na.rm = TRUE) ]
dataset[ , mv_mpagado              := rowSums( cbind( Master_mpagado,  Visa_mpagado) , na.rm=TRUE ) ]
dataset[ , mv_mpagospesos          := rowSums( cbind( Master_mpagospesos,  Visa_mpagospesos) , na.rm=TRUE ) ]
dataset[ , mv_mpagosdolares        := rowSums( cbind( Master_mpagosdolares,  Visa_mpagosdolares) , na.rm=TRUE ) ]
dataset[ , mv_fechaalta            := pmax( Master_fechaalta, Visa_fechaalta, na.rm = TRUE) ]
dataset[ , mv_mconsumototal        := rowSums( cbind( Master_mconsumototal,  Visa_mconsumototal) , na.rm=TRUE ) ]
dataset[ , mv_cconsumos            := rowSums( cbind( Master_cconsumos,  Visa_cconsumos) , na.rm=TRUE ) ]
dataset[ , mv_cadelantosefectivo   := rowSums( cbind( Master_cadelantosefectivo,  Visa_cadelantosefectivo) , na.rm=TRUE ) ]
dataset[ , mv_mpagominimo          := rowSums( cbind( Master_mpagominimo,  Visa_mpagominimo) , na.rm=TRUE ) ]

#a partir de aqui juego con la suma de Mastercard y Visa
dataset[ , mvr_Master_mlimitecompra:= Master_mlimitecompra / mv_mlimitecompra ]
dataset[ , mvr_Visa_mlimitecompra  := Visa_mlimitecompra / mv_mlimitecompra ]
dataset[ , mvr_msaldototal         := mv_msaldototal / mv_mlimitecompra ]
dataset[ , mvr_msaldopesos         := mv_msaldopesos / mv_mlimitecompra ]
dataset[ , mvr_msaldopesos2        := mv_msaldopesos / mv_msaldototal ]
dataset[ , mvr_msaldodolares       := mv_msaldodolares / mv_mlimitecompra ]
dataset[ , mvr_msaldodolares2      := mv_msaldodolares / mv_msaldototal ]
dataset[ , mvr_mconsumospesos      := mv_mconsumospesos / mv_mlimitecompra ]
dataset[ , mvr_mconsumosdolares    := mv_mconsumosdolares / mv_mlimitecompra ]
dataset[ , mvr_madelantopesos      := mv_madelantopesos / mv_mlimitecompra ]
dataset[ , mvr_madelantodolares    := mv_madelantodolares / mv_mlimitecompra ]
dataset[ , mvr_mpagado             := mv_mpagado / mv_mlimitecompra ]
dataset[ , mvr_mpagospesos         := mv_mpagospesos / mv_mlimitecompra ]
dataset[ , mvr_mpagosdolares       := mv_mpagosdolares / mv_mlimitecompra ]
dataset[ , mvr_mconsumototal       := mv_mconsumototal  / mv_mlimitecompra ]
dataset[ , mvr_mpagominimo         := mv_mpagominimo  / mv_mlimitecompra ]

# Transacciones por distintos medios
dataset[ , acciones_en_caja                 := ccajas_transacciones + ccajas_consultas + ccajas_depositos + ccajas_extracciones + ccajas_otras]
dataset[ , acciones_no_personales           := tcallcenter * ccallcenter_transacciones + thomebanking * chomebanking_transacciones]
dataset[ , accionesen_caja_y_no_personales  := acciones_en_caja + acciones_no_personales]

# En un momento el pago de servicios cambia de comportamiento inversamente que PagoMisCuentas
# Los combino para tener un total general
dataset[ , cservicios_mis_cuentas :=  cpagodeservicios + cpagomiscuentas]
dataset[ , mservicios_mis_cuentas :=  mpagodeservicios + mpagomiscuentas]

#valvula de seguridad para evitar valores infinitos
#paso los infinitos a NULOS
infinitos      <- lapply(names(dataset),function(.name) dataset[ , sum(is.infinite(get(.name)))])
infinitos_qty  <- sum( unlist( infinitos) )
if( infinitos_qty > 0 )
{
  cat( "ATENCION, hay", infinitos_qty, "valores infinitos en tu dataset. Seran pasados a NA\n" )
  dataset[mapply(is.infinite, dataset)] <- NA
}


#valvula de seguridad para evitar valores NaN  que es 0/0
#paso los NaN a 0 , decision polemica si las hay
#se invita a asignar un valor razonable segun la semantica del campo creado
nans      <- lapply(names(dataset),function(.name) dataset[ , sum(is.nan(get(.name)))])
nans_qty  <- sum( unlist( nans) )
if( nans_qty > 0 )
{
  cat( "ATENCION, hay", nans_qty, "valores NaN 0/0 en tu dataset. Seran pasados arbitrariamente a 0\n" )
  cat( "Si no te gusta la decision, modifica a gusto el programa!\n\n")
  dataset[mapply(is.nan, dataset)] <- 0
}

#FIN de la seccion donde se deben hacer cambios con variables nuevas

#grabo con nombre extendido
fwrite( dataset,
        file="./datasets/paquete_premium_corregido_ext.csv.gz",
        sep= "\t" )


quit( save="no")

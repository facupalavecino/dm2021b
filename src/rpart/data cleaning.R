#limpio la memoria
rm( list=ls() )
gc()

require("data.table")
require("rpart")

#Aqui se debe poner la carpeta de la computadora local
setwd("C:/Users/facun/Documents/ITBA/Cursadas/03 - Data Mining")  #Establezco el Working Directory

#cargo los datos de 202011 que es donde voy a ENTRENAR el modelo
dtrain  <- fread("./datasetsOri/paquete_premium_202011.csv")

dtrain[, active_quarter := ifelse(active_quarter == 1, "YES", "NO")]
dtrain[, cliente_vip := ifelse(cliente_vip == 1, "YES", "NO")]
dtrain[, tcallcenter := ifelse(tcallcenter == 1, "YES", "NO")]
dtrain[, tmobile_app := ifelse(tmobile_app == 1, "YES", "NO")]
dtrain[, internet := ifelse(internet == 0, "A", ifelse(internet == 1, "B", ifelse(internet == 2, "C", ifelse(internet == 3, "D", "E"))))]
dtrain[, cliente_antiguedad_years := ceiling(cliente_antiguedad / 12)]

# Intuici�n: si el cliente tiene gastos GRANDES (mucho monto para pocas transacciones) seguramente tenga cuotas y permanezca en el banco
dtrain[, tarjeta_visa_transaccion_promedio := mtarjeta_visa_consumo / ctarjeta_visa_transacciones]
dtrain[, tarjeta_master_transaccion_promedio := mtarjeta_master_consumo / ctarjeta_master_transacciones]


# Me quedo con las medidas descriptivas de cada variable num�rica
summaries = data.frame(variable=character(), minimo=numeric(), q1=numeric(), mean=numeric(), q3=numeric(), maximo=numeric(), lim_minimo=numeric(), lim_maximo=numeric())
outliers = data.frame(variable=character(), outliers_min = numeric(), outliers_max = numeric(), total = numeric())

dtrain[is.na(dtrain$Visa_mpagosdolares), Visa_mpagosdolares := mean(dtrain[, Visa_mpagosdolares], na.rm = T)]
dtrain[is.na(dtrain$Visa_cconsumos), Visa_cconsumos := ceiling(mean(dtrain[, Visa_cconsumos], na.rm = T))]
dtrain[is.na(dtrain$Visa_mconsumospesos), Visa_mconsumospesos := mean(dtrain[, Visa_mconsumospesos], na.rm = T)]
dtrain[is.na(dtrain$Visa_madelantopesos), Visa_madelantopesos := mean(dtrain[, Visa_madelantopesos], na.rm = T)]
dtrain[is.na(dtrain$Visa_cadelantosefectivo), Visa_cadelantosefectivo := ceiling(mean(dtrain[, Visa_cadelantosefectivo], na.rm = T))]
dtrain[is.na(dtrain$Visa_mconsumosdolares), Visa_mconsumosdolares := mean(dtrain[, Visa_mconsumosdolares], na.rm = T)]
dtrain[is.na(dtrain$Visa_madelantodolares), Visa_madelantodolares := mean(dtrain[, Visa_madelantodolares], na.rm = T)]
dtrain[is.na(dtrain$Visa_mconsumototal), Visa_mconsumototal := mean(dtrain[, Visa_mconsumototal], na.rm = T)]
dtrain[is.na(dtrain$Master_fultimo_cierre), Master_fultimo_cierre := ceiling(mean(dtrain[, Master_fultimo_cierre], na.rm = T))]
dtrain[is.na(dtrain$Master_mfinanciacion_limite), Master_mfinanciacion_limite := mean(dtrain[, Master_mfinanciacion_limite], na.rm = T)]
dtrain[is.na(dtrain$Master_msaldototal), Master_msaldototal := mean(dtrain[, Master_msaldototal], na.rm = T)]
dtrain[is.na(dtrain$Master_mpagado), Master_mpagado := mean(dtrain[, Master_mpagado], na.rm = T)]
dtrain[is.na(dtrain$Master_fechaalta), Master_fechaalta := ceiling(mean(dtrain[, Master_fechaalta], na.rm = T))]
dtrain[is.na(dtrain$Master_delinquency), Master_delinquency := ceiling(mean(dtrain[, Master_delinquency], na.rm = T))]
dtrain[is.na(dtrain$Master_Fvencimiento), Master_Fvencimiento := ceiling(mean(dtrain[, Master_Fvencimiento], na.rm = T))]
dtrain[is.na(dtrain$Master_msaldopesos), Master_msaldopesos := mean(dtrain[, Master_msaldopesos], na.rm = T)]
dtrain[is.na(dtrain$Master_mpagominimo), Master_mpagominimo := mean(dtrain[, Master_mpagominimo], na.rm = T)]
dtrain[is.na(dtrain$Master_status), Master_status := ceiling(mean(dtrain[, Master_status], na.rm = T))]
dtrain[is.na(dtrain$Master_msaldodolares), Master_msaldodolares := mean(dtrain[, Master_msaldodolares], na.rm = T)]
dtrain[is.na(dtrain$Master_mlimitecompra), Master_mlimitecompra := mean(dtrain[, Master_mlimitecompra], na.rm = T)]
dtrain[is.na(dtrain$Visa_fultimo_cierre), Visa_fultimo_cierre := ceiling(mean(dtrain[, Visa_fultimo_cierre], na.rm = T))]
dtrain[is.na(dtrain$Visa_status), Visa_status := ceiling(mean(dtrain[, Visa_status], na.rm = T))]
dtrain[is.na(dtrain$Visa_msaldodolares), Visa_msaldodolares := mean(dtrain[, Visa_msaldodolares], na.rm = T)]
dtrain[is.na(dtrain$Visa_mlimitecompra), Visa_mlimitecompra := mean(dtrain[, Visa_mlimitecompra], na.rm = T)]
dtrain[is.na(dtrain$Visa_mfinanciacion_limite), Visa_mfinanciacion_limite := mean(dtrain[, Visa_mfinanciacion_limite], na.rm = T)]
dtrain[is.na(dtrain$Visa_msaldototal), Visa_msaldototal := mean(dtrain[, Visa_msaldototal], na.rm = T)]
dtrain[is.na(dtrain$Visa_mpagado), Visa_mpagado := mean(dtrain[, Visa_mpagado], na.rm = T)]
dtrain[is.na(dtrain$Visa_fechaalta), Visa_fechaalta := ceiling(mean(dtrain[, Visa_fechaalta], na.rm = T))]
dtrain[is.na(dtrain$Visa_delinquency), Visa_delinquency := ceiling(mean(dtrain[, Visa_delinquency], na.rm = T))]
dtrain[is.na(dtrain$Visa_Fvencimiento), Visa_Fvencimiento := ceiling(mean(dtrain[, Visa_Fvencimiento], na.rm = T))]
dtrain[is.na(dtrain$Visa_msaldopesos), Visa_msaldopesos := mean(dtrain[, Visa_msaldopesos], na.rm = T)]
dtrain[is.na(dtrain$Visa_mpagominimo), Visa_mpagominimo := mean(dtrain[, Visa_mpagominimo], na.rm = T)]

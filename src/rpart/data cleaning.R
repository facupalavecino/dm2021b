require("data.table")
require("rpart")

#Aqui se debe poner la carpeta de la computadora local
setwd("C:\Users\facun\Documents\ITBA\Cursadas\03 - Data Mining")  #Establezco el Working Directory

#cargo los datos de 202011 que es donde voy a ENTRENAR el modelo
dtrain  <- fread("./datasetsOri/paquete_premium_202101.csv")

# Separo las variables según su tipo
var_pesos = c(
  'mrentabilidad',
  'mrentabilidad_annual',
  'mcomisiones',
  'mactivos_margen',
  'mpasivos_margen',
  'mcuenta_corriente_adicional',
  'mcuenta_corriente',
  'mcaja_ahorro',
  'mcaja_ahorro_adicional',
  'mcaja_ahorro_dolares',
  'mdescubierto_preacordado',
  'mcuentas_saldo',
  'mautoservicio',
  'mtarjeta_visa_consumo',
  'mtarjeta_master_consumo',
  'mprestamos_personales',
  'mprestamos_prendarios',
  'mprestamos_hipotecarios',
  'mplazo_fijo_dolares',
  'mplazo_fijo_pesos',
  'minversion1_pesos',
  'minversion1_dolares',
  'minversion2',
  'mpayroll',
  'mpayroll2',
  'mcuenta_debitos_automaticos',
  'ctarjeta_visa_debitos_automaticos',
  'mttarjeta_master_debitos_automaticos',
  'mpagodeservicios',
  'mpagomiscuentas',
  'mcajeros_propios_descuentos',
  'mtarjeta_visa_descuentos',
  'mtarjeta_master_descuentos',
  'mcomisiones_mantenimiento',
  'mcomisiones_otras',
  'mforex_buy',
  'mforex_sell',
  'mtransferencias_recibidas',
  'mtransferencias_emitidas',
  'mextraccion_autoservicio',
  'mcheques_depositados',
  'mcheques_emitidos',
  'mcheques_depositados_rechazados',
  'mcheques_emitidos_rechazados',
  'matm',
  'matm_other',
  'Master_mfinanciacion_limite',
  'Master_msaldototal',
  'Master_msaldopesos',
  'Master_msaldodolares',
  'Master_mconsumospesos',
  'Master_mconsumosdolares',
  'Master_mlimitecompra',
  'Master_madelantopesos',
  'Master_madelantodolares',
  'Master_mpagado',
  'Master_mpagospesos',
  'Master_mpagosdolares',
  'Master_mconsumototal',
  'Master_mpagominimo',
  'Visa_mfinanciacion_limite',
  'Visa_msaldototal',
  'Visa_msaldopesos',
  'Visa_msaldodolares',
  'Visa_mconsumospesos',
  'Visa_mconsumosdolares',
  'Visa_mlimitecompra',
  'Visa_madelantopesos',
  'Visa_madelantodolares',
  'Visa_mpagado',
  'Visa_mpagospesos',
  'Visa_mpagosdolares',
  'Visa_mconsumototal',
  'Visa_mpagominimo'
)

var_fechas = c(
  'Master_Fvencimiento',
  'Master_Finiciomora',
  'Master_fultimo_cierre',
  'Master_fechaalta',
  'Visa_Fvencimiento',
  'Visa_Finiciomora',
  'Visa_fultimo_cierre',
  'Visa_fechaalta'
)

var_categoricas = c(
  'active_quarter',
  'cliente_vip',
  'internet',
  'cproductos',
  'tpaquete2',
  'tpaquete3',
  'tpaquete4',
  'tcuentas',
  'ccuenta_corriente',
  'ccaja_ahorro',
  'ctarjeta_debito',
  'ctarjeta_debito_transacciones',
  'ctarjeta_visa',
  'ctarjeta_visa_transacciones',
  'ctarjeta_master',
  'ctarjeta_master_transacciones',
  'cprestamos_personales',
  'cprestamos_prendarios',
  'cprestamos_hipotecarios',
  'cplazo_fijo',
  'cinversion1',
  'cinversion2',
  'cseguro_vida',
  'cseguro_auto',
  'cseguro_vivienda',
  'cseguro_accidentes_personales',
  'ccaja_seguridad',
  'cpayroll_trx',
  'cpayroll2_trx',
  'ccuenta_debitos_automaticos',
  'ctarjeta_visa_debitos_automaticos',
  'ctarjeta_master_debitos_automaticos',
  'cpagodeservicios',
  'cpagomiscuentas',
  'ccajeros_propios_descuentos',
  'ctarjeta_visa_descuentos',
  'ctarjeta_master_descuentos',
  'ccomisiones_mantenimiento',
  'ccomisiones_otras',
  'cforex',
  'cforex_buy',
  'ctransferencias_recibidas',
  'ctransferencias_emitidas',
  'cextraccion_autoservicio',
  'ccheques_depositados',
  'ccheques_emitidos',
  'ccheques_depositados_rechazados',
  'ccheques_emitidos_rechazados',
  'tcallcenter',
  'ccallcenter_transacciones',
  'thomebanking',
  'chomebanking_transacciones',
  'ccajas_transacciones',
  'ccajas_consultas',
  'ccajas_depositos',
  'ccajas_extracciones',
  'ccajas_otras',
  'catm_trx',
  'catm_trx_other',
  'ctrx_quarter',
  'tmobile_app',
  'cmobile_app_trx',
  'Master_delinquency',
  'Master_status',
  'Master_cconsumos',
  'Master_cadelantosefectivo',
  'Visa_delinquency',
  'Visa_status',
  'Visa_cconsumos',
  'Visa_cadelantosefectivo'
)

# Me quedo con las medidas descriptivas de cada variable numérica
summaries = data.frame(variable=character(), minimo=numeric(), q1=numeric(), mean=numeric(), q3=numeric(), maximo=numeric(), lim_minimo=numeric(), lim_maximo=numeric())
outliers = data.frame(variable=character(), outliers_min = numeric(), outliers_max = numeric(), total = numeric())

for (var in var_pesos) {
  print(paste("Summary de ", var))
  b = boxplot(dtrain[, ..var])

  LIM_MIN = as.numeric(b$stats[1])
  LIM_MAX = as.numeric(b$stats[5])

  summaries[nrow(summaries) + 1,] = c(
    variable = var, 
    minimo = min(dtrain[, ..var], na.rm = T), 
    q1 = as.numeric(b$stats[2]), 
    mean = as.numeric(b$stats[3]),
    q2 = as.numeric(b$stats[4]), 
    maximo = max(dtrain[, ..var], na.rm = T), 
    lim_minimo = LIM_MIN, 
    lim_maximo = LIM_MAX
  )
  
  print(paste("Limites min y max de ", var, ": ", LIM_MIN, " | ", LIM_MAX))
  
  outliers_min = dim(subset(dtrain, (dtrain$var < LIM_MIN)))[1]
  outliers_max = dim(subset(dtrain, (dtrain$var > LIM_MAX)))[1]
  
  outliers[nrow(outliers) + 1,] = c(var, outliers_min, outliers_max, 240336)
}
summaries$minimo = as.numeric(summaries$minimo)
summaries$q1 = as.numeric(summaries$q1)
summaries$mean = as.numeric(summaries$mean)
summaries$q3 = as.numeric(summaries$q3)
summaries$maximo = as.numeric(summaries$maximo)
summaries$lim_minimo = as.numeric(summaries$lim_minimo)
summaries$lim_maximo = as.numeric(summaries$lim_maximo)

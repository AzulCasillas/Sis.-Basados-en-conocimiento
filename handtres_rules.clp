(defrule MAIN::cel-hsbc
   (ordencompra (tipo smartphones) (banco hsbc))  ; Corregido el nombre del hecho y las condiciones
   =>
   (printout t "Orden de compra de smartphone en HSBC" crlf))

(defrule MAIN::compu-azul
   (ordencompra (tipo computadores) (color azul))
   =>
   (printout t "Azules con 10% de descuento" crlf))

(defrule MAIN::cel-rojo
   (ordencompra (tipo smartphones) (marca samsung) (color rojo))
   =>
   (printout t "Samsung rojos con 5% de descuento" crlf))

(defrule MAIN::compu-mayoreo
   (ordencompra (tipo computadores) (banco santader))
   =>
   (printout t "Santander con 20% decuento" crlf))

(defrule MAIN::iphone8-bbva
   (ordencompra (tipo smartphone) (marca apple) (modelo iPhone8))
   (se-compro-con bbva)
   =>
   (printout t "2 meses sin intereses para iPhone 8 con bbva" crlf))

(defrule MAIN::compu-plata
   (ordencompra (tipo computadores) (color plata))
   =>
   (printout t "50% de descuento en computadores color plata" crlf))

(defrule MAIN::compu-samsung-banamex
   (ordencompra (tipo computadores) (marca samsung) (banco banamex))
   =>
   (printout t "24 meses laptops samsung para tarjetas banamex" crlf))

(defrule MAIN::xiaomi-rosa
   (ordencompra (tipo smartphones) (marca xiaomi) (color rosa))
   =>
   (printout t "10 % descuentoen celulares rosa xiaomi" crlf))

(defrule MAIN::oppo-descuento
   (ordencompra (tipo smartphones) (marca oppo) (total 1000))
   =>
   (printout t "5% descuento compras mayores a 1000 en oppo" crlf))

(defrule MAIN::compu-santander
   (ordencompra (tipo computadores) (banco santader))
   =>
   (printout t "Santander con 10% decuento" crlf))

(defrule MAIN::nu-compu
   (ordencompra (tipo computadores) (banco nu))
   =>
   (printout t "Computadoras con 10% de descuento al pagar con NU" crlf))

(defrule MAIN::descuento-accesorios
   (ordencompra (tipo accesorios) (color verde))
   =>
   (printout t "80% descuento en accesorios verdes" crlf))

(defrule MAIN::accesorios-bruno
   (ordencompra (tipo accesorios) (marca bruno))
   =>
   (printout t "Descuento en accesorios de la marca bruno" crlf))

(defrule MAIN::descuento-compu-negra
   (ordencompra (tipo computadores) (color negro))
   =>
   (printout t "15% de descuento en computadoras negras" crlf))

(defrule MAIN::compu-banorte
   (ordencompra (tipo computadores) (banco banorte))
   =>
   (printout t "20% de descuento en computadoras al pagar con Banorte" crlf))

(defrule MAIN::descuento-cel-huawei
   (ordencompra (tipo smartphones) (marca huawei) (banco bbva))
   =>
   (printout t "5% de descuento en smartphones Huawei alcomprar con bbva" crlf))

(defrule MAIN::samsung-note21-liverpool
   (ordencompra (tipo smartphones) (marca samsung) (modelo Note21))
   (banco liverpool visa)
   =>
   (printout t "12 meses sin intereses para Samsung Note 21 con tarjeta Liverpool VISA" crlf))

(defrule MAIN::macbook-iphone16-vales
   (ordencompra (tipo smartphones) (marca apple) (modelo iPhone16))
   (ordencompra (tipo computadores) (marca apple) (modelo MacBookAir))
   =>
   (printout t "100 pesos en vales por cada 1000 pesos de compra en MacBook Air y iPhone 16" crlf))

(defrule MAIN::funda-mica-descuento
   (ordencompra (tipo smartphones))
   =>
   (printout t "Funda y mica con 15% de descuento en accesorios" crlf))


(defrule recomendar-computadora-apple
   (ordencompra (tipo computador) (marca apple))  
   =>
   (printout t "Recomendamos el modelo MacBook Air o MacBook Pro de nueva generación para mayoristas" crlf)  ; Acción
)

(defrule recomendacion-mayorista
   (ordencompra (qty ?qty) (total ?total))  ; Verifica la cantidad de productos en la orden
   (test (> ?qty 10))  ; Si la cantidad es mayor a 10 unidades
   =>
   (printout t "Recordatorio: Como mayorista, se le puede tiene un descuento adicional." crlf)  ; Acción
)

(defrule recomendamos-accesorios-laptop
   (ordencompra (tipo computadores) (modelo ?modelo) (qty ?qty))  
   (test (> ?qty 0))  
   =>
   (bind ?total-accesorios (* ?qty 1000))  
   (bind ?descuento-accesorios (* ?total-accesorios 0.20)) 
   (printout t "Recomendamos accesorios adicionales con 20% de descuento para la compra de una laptop. Descuento en accesorios: " ?descuento-accesorios crlf)  
)

(defrule descuento-mayoreo
   (ordencompra (tipo ?tipo) (marca ?marca) (modelo ?modelo) (color ?color) (qty ?q&:(>= ?q 10)) (total ?total&:(> ?total 0)) (banco ?banco) (pago ?pago))
   =>
   (printout t "Descuento mayoreo aplicado para " ?marca " " ?modelo crlf)
)

(defrule stock-compu
   (ordencompra (tipo computadores) (marca ?marca) (modelo ?modelo) (color ?color) (qty ?cantidad))  
   (computadores (marca ?marca) (modelo ?modelo) (color ?color) (qty ?stock))  
   (test (> ?stock ?cantidad))  
   =>
   (printout t "Stock actualizado para: " ?modelo " " ?marca " " ?color " | Nueva cantidad: " (- ?stock ?cantidad) crlf)  
)


(defrule stock-smartphones
   (ordencompra (tipo smartphones) (marca ?marca) (modelo ?modelo) (color ?color) (qty ?cantidad))
   (smartphones (marca ?marca) (modelo ?modelo) (color ?color) (qty ?stock))
   (test (> ?stock ?cantidad))
   =>
   (printout t "Stock actualizado para: " ?modelo " " ?marca " " ?color " | Nueva cantidad: " (- ?stock ?cantidad) crlf)
)

(defrule stock-accesorios
   (ordencompra (tipo accesorios) (marca ?marca) (color ?color) (qty ?cantidad))
   (accesorios (marca ?marca) (color ?color) (qty ?stock))
   (test (> ?stock ?cantidad))
   =>
   (printout t "Stock actualizado para accesorio: " ?marca " " ?color " | Nueva cantidad: " (- ?stock ?cantidad) crlf)
)

(defrule MAIN::generar-vale-iphone
   (ordencompra (tipo smartphones) (marca apple) (modelo ?modelo&:(str-compare ?modelo "iPhone" 0)))
   =>
   (assert (vales (idvale iphone-vale) (cantidad 100)))
   (printout t "Generado un vale de 100 pesos para la compra de un iPhone" crlf)
)





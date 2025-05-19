(deftemplate MAIN::clientes
   (slot tipo (type SYMBOL)))

(deftemplate MAIN::ordencompra
   (slot tipo (type SYMBOL))
   (slot marca (type SYMBOL))
   (slot modelo (type SYMBOL))
   (slot color (type SYMBOL))
   (slot qty (type INTEGER))
   (slot pago (type SYMBOL))
   (slot banco (type SYMBOL))
   (slot total (type INTEGER)))

(deftemplate MAIN::smartphones
   (slot marca (type SYMBOL))
   (slot modelo (type SYMBOL))
   (slot precio (type INTEGER))
   (slot color (type SYMBOL))
   (slot qty (type INTEGER)))

(deftemplate MAIN::computadores
   (slot marca (type SYMBOL))
   (slot modelo (type SYMBOL))
   (slot precio (type INTEGER))
   (slot color (type SYMBOL))
   (slot qty (type INTEGER)))

(deftemplate MAIN::accesorios
   (slot marca (type SYMBOL))
   (slot precio (type INTEGER))
   (slot color (type SYMBOL))
   (slot qty (type INTEGER)))

(deftemplate MAIN::tarjeta
   (slot banco (type SYMBOL))
   (slot grupo (type SYMBOL))
   (slot fechaexp (type STRING))) 

(deftemplate MAIN::vales
   (slot idvale (type SYMBOL))
   (slot cantidad (type INTEGER)))

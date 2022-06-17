Feature: Reporte de productos defectuosos

    Scenario: Seleccion de día en calendario 
        Given el supervisor inicio sesion en la aplicacion
        And se encuentra en la pantalla 'Task'
        When selecciona la opcion 'Reportes'
        Then el usuario visualiza la pantalla 'Calendario'
        And selecciona una 'fecha habilitada'
        And selecciona la opcion 'Productos defectuosos'
    
    Example:
    |Reportes|Fecha habilitada|Productos defectuosos|

    |Fecha habilitada|26/11/2022|

    Scenario: Envio de reporte de productos defectuosos
        Given el supervisor selecciona una fecha habilitada
        And selecciono la opcion Productos defectuosos
        When selecciona el icono del 'Container N°XXX' en el mapa
        Then el sistema muestra los detalles del producto defectuoso: ID del operador, Numero de contenedor, Nombre del suspevisor
        , Codigo del supervisor, Codigo de proveedor y Evidencia audiovisual
        And el supervisor presiona el boton 'Enviar Reporte'
    
    Example:
    |Fecha habilitada|Productos defectuosos|Contenedor|ID del operador|Numero de contenedor|Nombre del suspevisor|Codigo del supervisor|Codigo de proveedor|Evidencia audiovisual|Enviar Reporte|

    |Fecha habilitada|26/11/2022|
    |Contenedor|"Contenedor 2"|
    |ID del operador|O20181B530|
    |Numero de contenedor|2|
    |Nombre del suspevisor|"Marín Carrión, Rosario"|
    |Codigo del supervisor|O20505H049|
    |Codigo de proveedor|O20201C043|
    |Evidencia audiovisual|Videos, fotos|





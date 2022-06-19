Feature:  Registro de productos

    Scenario: Registro de contenedor seleccionado
            Given el operador presiono el boton 'Registro'
            And se encuentra en la pantalla 'Registro de contenedor'
            And el sistema muestra los detalles a registrar Hora de llegada, Numero de rampa y Evidencia audiovisual
            When selecciona el boton 'Guardar', se  registra la hora 
            And completa el campo 'Numero de rampa'
            Then el sistema registra los detalles ingresados

        Examples:

        |Registro|Hora de llegada|Numero de rampa|Evidencia audiovisual|Guardar|
        
        |Hora de llegada |10:35 am|
        |Numero de rampa|Rampa 4|
        |Evidencia audiovisual|Videos, fotos|

    Scenario: Registro de evidencia audiovisual del contenedor
            Given el supervisor visualiza la pantalla Registro del contenedor
            When selecciona el icono de camara
            Then la aplicacion abre la camara del dispositivo movil
            And el usuario captura las evidencias necesarias

        Example:

        |Icono de camara|
Feature:  Registro de productos

      Scenario: Registro de producto
        Given el operario presiono el boton 'Registrar Producto'
        And se encuentra en la pantalla 'Registro de producto'
        When el operario aproxima el escaner al codigo de barra del producto
        Then la aplicacion muestra el codigo del producto escaneado en la pantalla 
        And presiona el boton 'Registrar'

        Example:

        |Registrar Producto|Codigo del producto escaneado|Registrar|

        |Codigo del producto escaneado|INC0000234|

    Scenario: Registro de producto defectuoso
        Given el operario verifica que el producto se encuentra en estado defectuoso
        And escanea el codigo del producto
        When presiona el checkbox de 'Estado defectuoso'
        Then la aplicacion habilitado el icono de camara y video
        And el usuario captura las evidencias necesarias para justificar el estado del producto
        And el usuario presiona el boton 'Registrar'
    
        Example:

        |Codigo del producto|Estado defectuoso|Registrar|

        |Codigo del producto|INC0000234|

    Scenario: Finalizacion de registro de productos
        Given el operario termino de registrar los productos 
        When presiona el boton 'Finalizar registro'
        When la aplicacion abre la camara del dispositivo movil
        And el usuario captura la evidencias necesarias 
        And muestra una pantalla con el mensaje confirmacion y la hora exacta

        Example:

        |Finalizar registro|Mensaje confirmacion|Hora exacta|

        |Mensaje confirmacion|"Se ha finalizado el registro de productos con exito"|
        |Hora exacta|18:35 pm|
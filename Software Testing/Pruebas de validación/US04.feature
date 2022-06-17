Feature: Gestion de perfiles

    Scenario: Iniciar sesion
        Given el que el supervisor/operador se encuentra afiliado al aplicativo
        And se encuentra en la pantalla 'Login'
        When  haya completado los campos 'Usuario' y 'contraseña'
        Then podrá presionar el botón 'Sing in'
        And tendrá acceso a la página 'Home'
    
    Example: 
    |Usuario|Contrasena|Login|Sing in|

    |Usuario|Jorge Chavez|
    |Contraseña|cas4@f^%qr|

    Scenario: Supervisor/Operario olvido su contraseña
        Given el supervisor/operario se encuentra afiliado al aplicativo
        And se ha olvidado la 'contraseña'
        And se encuentre en la pantalla 'Iniciar sesion'
        When haya presionado el boton 'Olvide mi contraseña'
        Then el sistema enviara al supervisor/operario a la pantalla 'Verificar cuenta'

    Example:
    |Olvide mi contraseña|Verificar cuenta|

    Scenario: Verificar cuenta
        Given el supervisor/operario se encuentra en la pantalla 'Verificar cuenta'
        And complete el campo 'Correo'
        When presione el boton 'Aceptar'
        Then el sistema le enviara un correo para la identificacion
    
    Example:
    |Verificar cuenta|Correo|Aceptar|Correo enviado por el sistema|

    |Correo|jkdawkings@easyware.me|
    |Correo enviado por el sistema|"Se ha enviado este mensaje para realizar la identificacion de cuenta"|

    Scenario: Reestablecer contraseña
        Given el supervisor/operario se encuentra en la pantalla 'Reestablecer contraseña'
        And se ha identificado
        And ha completado los campos de 'Contraseña' y 'Verificar contraseña'
        When haya presionado el boton 'Reestablecer'
        Then el sistema actualiza la contraseña
        And notifica que se reestablecio correctamente la contraseña
    
    Example:
    |Reestablecer contraseña|Contrasena|Verificar contraseña|Reestablecer|Notificacion|

    |Contraseña|opQt_^#qwer|
    |Notificacion|"Su contraseña ha sido reestablecida correctamente"|

Feature: Asignacion de orden de desembarco de contenedor

    Scenario: Seleccion de dia en calendario
        Given el supervisor inicio sesion en la aplicacion
        And se encuentra en la pantalla 'Task'
        When selecciona la opcion 'Asignar orden'
        Then el usuario visualiza la pantalla 'Calendario'
        And selecciona una fecha habilitada
    
    Example:
    |Asignar orden|Seleccionar fecha habilitada|

    |Seleccionar fecha habilitada|26/11/2022|

    Scenario: Asignación de orden de desembarco de contenedor
        Given el supervisor selecciono un fecha habilitada
        And visualiza la pantalla 'Details'
        And el sistema muestra la lista de contenedores que llegaran en el dia
        When selecciona 'Contenedor N°XXX'
        Then el sistema muestra Codigo del contenedor, Hora de llegada programada
        And y el usuario selecciona el boton 'Enviar orden'

    Example:
    |Seleccionar fecha habilitada|Lista de contenedores|Container|Codigo del contenedor|Hora de llegada programada|Enviar orden|

    |Seleccionar fecha habilitada|26/11/2022|
    |Lista de contenedores|"Contenedor 1, Contenedor 2, Contenedor 3 ..."|
    |Contenedor|"Contenedor 2"|
    |Codigo del contenedor|INC0000025684|
    |Hora de llegada programada|10:35 am|


    Scenario: Visualizacion de los contenedores en el mapa
        Given el supervisor selecciono una fecha habilitada
        And visualiza la pantalla 'Details'
        And el sistema muestra la lista de contenedores que llegaran en el dia
        And el boton 'Tracking'
        When selecciona el boton 'Tracking'
        Then el sistema muestra la pantalla 'Maps'
        And el supervisor visualiza la ubicacion de los contenedores del dia en tiempo real

    Example:
    |Fecha habilitada|Lista de contenedores|Tracking|Ubicacion de los contenedores del dia en tiempo real|

    |Fecha habilitada|26/11/2022|
    |Lista de contenedores|"Contenedor 1, Contenedor 2, Contenedor 3 ..."|
    |Ubicacion de los contenedores del dia en tiempo real|Mostrar en pantalla un mapa de seguimiento|

    Scenario: Informacion de contacto del transportista
        Given el supervisor visualiza la pantalla 'Maps'
        When selecciona el icono del 'Container N°XXX' en el mapa
        Then el sistema muestra la informacion de contacto del conductor (Nombres y apellidos, numero telefonico)

    Example:
    |Contenedor|Nombres y apellidos|Numero telefonico|

    |Contenedor|"Contenedor 2"|
    |Nombres y apellidos|"Marcos Andres Perez Humboldt"|
    |Numero telefonico|924658712|

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
Feature: Registro de productos

    Scenario: Seleccion de dia en calendario
        Given el operador inicio sesion en la aplicacion
        And se encuentra en la pantalla 'Calendario'
        When selecciona una 'fecha habilitada'
        Then el sistema muestra la pantalla 'Details'
        And el sistema muestra la lista de contenedores habilitados a registrar
    
    Example:
    |Fecha habilitada|Lista de contenedores habilitados|

    |Fecha habilitada|26/11/2022|
    |Lista de contenedores|"Contenedor 1, Contenedor 2, Contenedor 3 ..."|

    Scenario: Seleccion de contenedor disponible
        Given el supervisor visualiza la pantalla 'Details'
        When selecciona un contenedor disponible
        Then se despliega informacion del contenedor, Codigo de contenedor y Horario de llegada
        And se visualiza el boton Registro y Exportar
    
    Examples:
    |Contenedor|Codigo de contenedor|Horario de llegada|Registro|Exportar|

    |Contenedor|"Contenedor 2"|
    |Codigo de contenedor|8 410100 025155|
    |Hora de llegada |10:35 am|
    
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

    Scenario: Finalizacion de registro de productos
        Given el operario termino de registrar los productos 
        When presiona el boton 'Finalizar registro'
        When la aplicacion muestra la pantalla de verificacion
        And presiona el boton Si
        And el sistema muestra el mensaje de confirmacion y al hora de finalizacion del proceso

    Example:

    |Finalizar registro|Mensaje confirmacion|Hora de finalizacion|
    
    |Mensaje confirmacion|"Se ha finalizado el registro de productos con exito"|
    |Hora de finalizacion|18:35 pm|
    Scenario: Exportar el registro del contenedor
        Given el sistema mostro el mensaje de confirmacion y la hora de finalizacion del proceso
        And el operario visualiza la pantalla 'Details'
        When presiona el boton Exportar
        Then la aplicacion envia el reporte a la base de datos

    Example:
    
    |Mensaje confirmacion|Hora de finalizacion|Exportar|Reporte a la base de datos|

    |Mensaje confirmacion|"Se ha finalizado el registro de productos con exito"|
    |Hora de finalizacion|18:35 pm|
    

Feature: Afiliar operarios
    
    Scenario: Finalizacion de registro de productos
        Given el supervisor se encuentra en la pantalla Task
        When presiona el boton 'Afiliar'
        Then la aplicacion muestra la pantalla Afiliar
        And el supervisor completa los campos Nombres, Apellidos, Fecha de Nacimiento , DNI, Correo electronico
        And presiona el boton Afiliar

    Example:

    |Afiliar|Nombres| Apellidos| Fecha de Nacimiento| DNI| Correo electronico|

    |Nombres| Humala Lautaro|
    |Apellidos| Caballero Huaman|
    |Fecha de Nacimiento| 16/11/1997|
    |DNI| 4567890|
    |Correo electronico|koala@easyware.me
Feature: Gestion de perfiles

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

    |Contraseña|80542165|
    |Notificacion|"Su contraseña ha sido reestablecida correctamente"|


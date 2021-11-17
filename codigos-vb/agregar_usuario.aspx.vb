
Imports System                  'Necesaria del sistema   
Imports System.Drawing          'También para diseño
Imports Microsoft.VisualBasic   'Especifica para VisualBasic
'--------------------------------------------------------------------------- 
Imports System.Data             'Para el acceso a datos SQL SERVER
Imports System.Data.SqlClient

Partial Class Agregar_agregar_usuario
    Inherits System.Web.UI.Page

    Protected Sub btnagregar_Click(ByVal sender As Object,
                                   ByVal e As System.EventArgs) Handles btnagregar.Click

        'Este primer segmento de sodigo es para determinar si ya tenemos el usuario
        'registrado, la mayoria de sistemas web se valida el usuario por
        'medio de su nombre de usuario o correo.

        'creamos la variable conexion con la cadena del Origen de Datos
        'Que podemos ver aqui, bueno que usando el sqlDataSource1 creado podemos iniciar
        'la conexion a la base de datos.
        Dim conexion As New SqlConnection(Me.SqlDataSource1.ConnectionString)

        'Creamos una variable usuario para almacenar el usuario ingresado sin espacios
        Dim usuario As String

        'Quitamos cualquier espacio digitado en el campo con la funcion TRIM
        'Es recomendable aplicar TRIM aunque podria funcionar son usarla.
        usuario = Trim(txtusuario.Text)

        'Creamos la variable de consulta_comprobar y le asignamos la cadena de consulta
        'Aqui comparamos si existe el nombre de usuario
        Dim consulta_comprobar As New SqlCommand("SELECT Count(*) FROM usuario WHERE nombre_usuario = @usuario", conexion)

        'Abrimos la conexión
        conexion.Open()

        'Asignamos a un parametro el valor del campo correo ingresado para
        'pasarlo a la consulta
        consulta_comprobar.Parameters.AddWithValue("@usuario", usuario)

        'Creamos la variable i para contar los registros encontrados
        Dim i As Integer
        'Con la funcion ExecuteScalar determinamos cuantos registros hay
        'Si tenemos al menos uno es que ya existe un usuario que usa el correo
        'ingresado.
        i = CInt(consulta_comprobar.ExecuteScalar())
        'Tomamos la desicion si existe o no
        If i > 0 Then
            ' Avisamos y salimos
            Me.lblmensaje.Text = "El nombre de usuario ingresado ya está en uso"

            'Cerramos la conexión
            conexion.Close()

            '#################################################################################
            'Si El usuario no existe, lo añadimos, se ejecuta la condicional else
        Else

            Dim cadenaconsulta As String

            cadenaconsulta = "insert into usuario(nombre_usuario,clave,tipo) values(@usuario,@clave,@tipo)"


            'Usamos el comando Insert del DataSource
            Dim consulta_agregar As New SqlCommand(cadenaconsulta, conexion)
            'Dim consulta As New SqlCommand(cadenaconsulta, conexion)

            consulta_agregar.Parameters.AddWithValue("@usuario", txtusuario.Text)
            consulta_agregar.Parameters.AddWithValue("@clave", txtclave.Text)
            consulta_agregar.Parameters.AddWithValue("@tipo", lsttipo.Text)

            Try

                'Ejecutamos la consulta que agrega los datos pasados en los parametros
                'a los campos de la tabla.
                consulta_agregar.ExecuteNonQuery()

                'Cerramos la conexión
                conexion.Close()

                'Presentamos el mensaje que se agrego con exito el nuevo usuario
                Me.lblmensaje.Text = "Se agregó el nuevo usuario correctamente"


                'La funcion Catch permite capturar cualquier error al intentar guardar
            Catch error_excepcion As Exception

                'Para presentarlo en una etiqueta, evitamos error de compilacion
                Me.lblmensaje.Text = error_excepcion.Message

            End Try
        End If
    End Sub
End Class

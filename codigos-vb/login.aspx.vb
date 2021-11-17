
Imports System.Data.SqlClient

Partial Class Seguridad_login
    Inherits System.Web.UI.Page
	

    Protected Sub btnvalidar_Click(ByVal sender As Object,
        ByVal e As System.EventArgs) Handles btnvalidar.Click

        Dim usuario As String
        Dim clave As String

        If txtusuario.Text <> "" And txtclave.Text <> "" Then

            'creamos la variable conexion con la cadena del Origen de datos Creado
            'Que podemos ver aqui, bueno que usando el sqlDataSource creado podemos iniciar
            'la conexion a la base de datos.
            Dim conexion As New SqlConnection(Me.SqlDataSource1.ConnectionString)

            'Quitamos cualquier espacio digitado en el campo con la funcion TRIM
            'Es recomendable aplicar TRIM aunque podria funcionar son usarla.
            usuario = Trim(txtusuario.Text)
            clave = Trim(txtclave.Text)

            'Creamos la variable de consulta y le asignamos precisamente la consulta
            'Aqui comparamos si existe la direccion de correo
            Dim cadena As String = "SELECT count(*) FROM usuario WHERE nombre_usuario = @nombre and clave=@clave"
            Dim consulta_comprobar As New SqlCommand(cadena, conexion)

            'Abrimos la conexión
            conexion.Open()

            'Asignamos a un parametro el valor del campo correo ingresado para
            'pasarlo a la consulta
            consulta_comprobar.Parameters.AddWithValue("@nombre", usuario)
            consulta_comprobar.Parameters.AddWithValue("@clave", clave)

            'Creamos la variable i para contar los registros encontrados
            Dim i As Integer

            'Con la funcion ExecuteScalar determinamos cuantos registros hay
            'Si tenemos al menos uno es que ya existe un usuario que usa el correo
            'ingresado.
            i = CInt(consulta_comprobar.ExecuteScalar())

            'Tomamos la desicion si existe o no
            If i > 0 Then

                Session("autorizado") = usuario
                Response.Redirect("~/index.aspx")

                'Cerramos la conexión
                conexion.Close()

            Else
                Me.lblmensaje.Text = "El usuario o contraseña incorrectos"
            End If
        End If
    End Sub

End Class

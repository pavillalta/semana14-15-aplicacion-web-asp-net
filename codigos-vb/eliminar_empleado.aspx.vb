
Imports System                  'Necesaria del sistema   
Imports System.Drawing          'También para diseño
Imports Microsoft.VisualBasic   'Especifica para VisualBasic
'--------------------------------------------------------------------------- 
Imports System.Data             'Para el acceso a datos SQL SERVER
Imports System.Data.SqlClient

Partial Class Agregar_eliminar_empleado
    Inherits System.Web.UI.Page

    Protected Sub btnagregar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnagregar.Click

        'Incorporamos la cadena de conexion usando el origen de la tabla empleado
        Dim conexion As New SqlConnection(Me.SqlDataSource_empleados.ConnectionString)

        'Creamos la variable de consulta_comprobar y le asignamos la cadena de consulta
        'Aqui comparamos si el codigo ya ha sido asignado
        Dim consulta_comprobar As New SqlCommand("SELECT Count(*) FROM empleado WHERE codigo = @codigo", conexion)

        'Abrimos la conexión
        conexion.Open()

        'Asignamos a un parametro el valor del campo correo ingresado para
        'pasarlo a la consulta
        consulta_comprobar.Parameters.AddWithValue("@codigo", Trim(txtcodigo.Text))

        'Creamos la variable i para contar los registros encontrados
        Dim registros As Integer

        'Con la funcion ExecuteScalar determinamos cuantos registros hay
        'Si tenemos al menos uno es que ya existe un empleado con el codigo
        registros = CInt(consulta_comprobar.ExecuteScalar())

        'Tomamos la desicion si existe o no
        If registros > 0 Then

            'consulta
            Dim eliminar As String = "delete from empleado where codigo = " & Trim(txtcodigo.Text) & ""

            'Ejecucion de consulta
            Dim consulta_eliminar As New SqlCommand(eliminar, conexion)

            Try
                'Ejecutamos la consulta que agrega los datos pasados en los parametros
                'a los campos de la tabla empleado.
                consulta_eliminar.ExecuteNonQuery()

                'Presentamos el mensaje que se agrego con exito el nuevo usuario
                Me.lblmensaje.Text = "Se elimino el empleado correctamente"

                'La funcion Catch permite capturar cualquier error al intentar guardar
            Catch error_excepcion As Exception

                'Para presentarlo en una etiqueta, evitamos error de compilacion
                Me.lblmensaje.Text = error_excepcion.Message

            End Try

            '#################################################################################
            'Si El usuario no existe, mostramos alerta, se ejecuta la condicional else
        Else

            ' Avisamos y salimos
            Me.lblmensaje.Text = "No existe empleado con el codigo asignado"

        End If
        'Cerramos la conexión
        conexion.Close()
    End Sub
End Class

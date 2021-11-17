
Imports System                  'Necesaria del sistema   
Imports System.Drawing          'También para diseño
Imports Microsoft.VisualBasic   'Especifica para VisualBasic
'--------------------------------------------------------------------------- 
Imports System.Data             'Para el acceso a datos SQL SERVER
Imports System.Data.SqlClient

Partial Class Agregar_agregar_empleado
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
            ' Avisamos y salimos
            Me.lblmensaje.Text = "El codigo asignado al empleado ya fue asignado"

            'Cerramos la conexión
            conexion.Close()

            '#################################################################################
            'Si El usuario no existe, lo añadimos, se ejecuta la condicional else
        Else

            'Creamos la variable donde almacenamos la cadena de consulta
            'Que en este caso es una instruccion Insert Into para guardar
            'en la tabla empleado
            Dim consulta As String

            consulta = "insert into empleado" & _
            "(codigo,nombre,apellido,dui,nit,afp,isss,telefono,correo," & _
            "salario,direccion,fecha_contrato,codigopuesto)" & _
            "values(@codigo,@nombre,@apellido,@dui,@nit,@afp,@isss,@telefono,@correo," & _
            "@salario,@direccion,@fecha_contrato,@codigopuesto)"


            'Ejecutamos la consulta usando la funcion SQLCommand
            Dim consulta_agregar As New SqlCommand(consulta, conexion)

            'Paso de las variables a parametros que recive la cadena de consulta
            consulta_agregar.Parameters.AddWithValue("@codigo", txtcodigo.Text)
            consulta_agregar.Parameters.AddWithValue("@nombre", txtnombres.Text)
            consulta_agregar.Parameters.AddWithValue("@apellido", txtapellidos.Text)
            consulta_agregar.Parameters.AddWithValue("@dui", txtdui.Text)
            consulta_agregar.Parameters.AddWithValue("@nit", txtnit.Text)
            consulta_agregar.Parameters.AddWithValue("@afp", txtafp.Text)
            consulta_agregar.Parameters.AddWithValue("@isss", txtisss.Text)
            consulta_agregar.Parameters.AddWithValue("@telefono", txttelefono.Text)
            consulta_agregar.Parameters.AddWithValue("@correo", txtcorreo.Text)
            consulta_agregar.Parameters.AddWithValue("@salario", txtsalario.Text)
            consulta_agregar.Parameters.AddWithValue("@direccion", txtdireccion.Text)
            consulta_agregar.Parameters.AddWithValue("@fecha_contrato", txtfechacontrato.Text)
            consulta_agregar.Parameters.AddWithValue("@codigopuesto", lstpuesto.Text)

            Try

                'Ejecutamos la consulta que agrega los datos pasados en los parametros
                'a los campos de la tabla empleado.
                consulta_agregar.ExecuteNonQuery()

                'Cerramos la conexión
                conexion.Close()

                'Presentamos el mensaje que se agrego con exito el nuevo usuario
                Me.lblmensaje.Text = "Se agregó el nuevo empleado correctamente"


                'La funcion Catch permite capturar cualquier error al intentar guardar
            Catch error_excepcion As Exception

                'Para presentarlo en una etiqueta, evitamos error de compilacion
                Me.lblmensaje.Text = error_excepcion.Message

            End Try
        End If
    End Sub
End Class

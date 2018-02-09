using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Npgsql;
//using Mono;
using NpgsqlTypes;


namespace Examen_1613550
{
    class Program
    {
        static String Fuente;
        static String tab, condicion;
        static void Main(string[] args)
        {
            //Servidor del trabajo
            SqlConnection con = new SqlConnection(@"Data Source=CCG-RRHH-2012\MYSQL;Initial Catalog=configuracion;Integrated Security=True"); 
            //Servidor de portatil
           //  SqlConnection con = new SqlConnection("Data Source=SAMSUNG-PC;Initial Catalog=configuracion;Integrated Security=True"); 
            //Coneccion con postgre en servidor portatil
            //NpgsqlConnection con = new NpgsqlConnection("Server=localhost;port=5432;Database=nomina1;User ID=postgres;Password=1234");
           //Instanciando al modulo  generico 
            modulo_generico modulo = new modulo_generico(con);
            //Console.WriteLine(con.State);
            Console.WriteLine("***********************************************************************");
            Console.WriteLine("*                   programacion Avansada                             *");
            Console.WriteLine("***********************************************************************");
            Console.WriteLine("***********     Cristhian Calero Gazo 10961843*************************");
            Console.WriteLine("");
            Console.WriteLine("=======================================================================");
            Console.WriteLine("ID  Nombre Servidores   Base Datos     Tabla     Nombre Campos   Condicion    ");
            Console.WriteLine("=======================================================================");
            
           
            //creando un variable tipo tabla y ejecutando el metodo captura pasando el parametro para consulta

            //CAtuo el primer registro de la tabla conneccion
            //DataTable tabla = modulo.Captura("select TOP 1 * from Tb_coneccion");
            //DataTable tabla = modulo.Captura("select * from Tb_coneccion");
            DataTable tabla = modulo.Captura("SELECT RTRIM(Tb_coneccion.id_coneccion),RTRIM(Tb_coneccion.name_server),RTRIM(db.name_bd),RTRIM(ta.name_tabla),RTRIM(ca.d_campos),RTRIM(co.d_condicion) FROM     tb_base_datos AS db INNER JOIN tb_tablas AS ta ON ta.id_tabla = db.id_bd INNER JOIN tb_campos AS ca ON ca.id_tabla = ta.id_tabla INNER JOIN tb_condicion AS co ON co.id_tabla = ta.id_tabla CROSS JOIN Tb_coneccion Where Tb_coneccion.Id_coneccion=3");
            
            foreach (DataRow fila in tabla.Rows)
                        {
                          string registro = fila[0] + " " + (fila[1]) + " " + fila[2] + " " + fila[3]+ " " + fila[4]+" " + fila[5];
                            
                String nameserver = ""+fila[1];
                nameserver = nameserver.Replace(" ", "");

//                Fuente = "Data Source=" + nameserver + ";" + "Initial Catalog=" + "control_visita" + ";" + "Integrated Security=True";
                Fuente = "Data Source=" + fila[1] + ";" + "Initial Catalog=" + fila[2] + ";" + "Integrated Security=True";
                tab = ""+fila[3];
                condicion = ""+fila[5];
                 Console.WriteLine(registro);

            }
            Console.ReadKey();
            SqlConnection con2 = new SqlConnection(Fuente);
            modulo_generico modulo2 = new modulo_generico(con2);
            Console.WriteLine("***********************************************************************");
            Console.WriteLine("*                  Conectando a la Segunda Base de Datos               *");
            Console.WriteLine("***********************************************************************");

//            DataTable tabla1 = modulo2.Captura("select * from cat_oficina");
            //DataTable tabla1 = modulo2.Captura("select * from "+tab+ " where " +condicion);
            DataTable tabla1 = modulo2.Captura("select * from " + tab);

            foreach (DataRow fila in tabla1.Rows)
             {
//                string registro = fila[0] + " " + fila[1]+" " + fila[2];
                string registro1 = fila[0] + " " + fila[1];
                Console.WriteLine(registro1);

            }

            Console.ReadKey();

    }
}
}
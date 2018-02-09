using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Examen_1613550
{
    class modulo_generico
    {
        //Declaracion de variables genericas de la clase padre de sql, postgres.
        private DbCommand comando;
        private DbConnection conexion;
        private IDataReader dtr;
        //Constructor
        public modulo_generico(DbConnection con)
        {
         //A la varible de global le asignamo le variable que viene como´parametro
            this.conexion = con;
        }
        //metodo open para abrir la connecion
        public void open()
        {
         this.conexion.Open();
        }
        public void close()
        {
         this.conexion.Close();
        }
        //creo un metodo de tipo Data table que recibe un parametro que trae la cadena de la consulta
        public DataTable Captura( String sql)
        {
         this.open();
         DataTable resultado = new DataTable();
         comando = conexion.CreateCommand();
         comando.CommandText = sql;
         dtr = comando.ExecuteReader();
         resultado.Load(dtr);
         dtr.Close();
         this.close();
         return resultado;
        }

    }
}

using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
using System.IO;
using System.Data.SqlClient;
/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.Helpers
{
    
    /// <summary>
    /// Summary description for RunSQLServerScript
    /// NOT FINISHED
    /// </summary>
    public class RunScriptSQLServer : RunScript
    {
        public RunScriptSQLServer(string connectionString,string filename) : base(connectionString, filename)
        {
            
        }

        public override void Run()
        {
            var sqlScript = File.ReadAllText(filename);

            using (var connection = new SqlConnection(connectionString))
            {
                var server = new Server(new ServerConnection(connection));
                server.ConnectionContext.ExecuteNonQuery(sqlScript);
            }
        }

    
    }
}
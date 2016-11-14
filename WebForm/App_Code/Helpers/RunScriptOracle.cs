using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System.IO;
using System.Data;

/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.Helpers
{

    /// <summary>
    /// Summary description for RunScriptOracle
    /// Run a script file on Oracle
    /// NOT FINISHED!!
    /// </summary>
    public class RunScriptOracle : RunScript
    {

        public RunScriptOracle(string connectionString, string filename) : base(connectionString, filename)
        {

        }

        public override void Run()
        {

            var content = string.Format("BEGIN {0} END", File.ReadAllText(filename));
            using (var oracleConnection = new OracleConnection(connectionString))
            {
                oracleConnection.Open();
                //check the table rr_recipe is exist?
                using (var command = new OracleCommand("select table_name from user_tables where table_name='rr_recipe'") { Connection = oracleConnection })
                {
                    command.CommandType = CommandType.Text;
                    //if table rr_recipe is not exist, execute the sql file
                    OracleDataReader reader = command.ExecuteReader();
                    if (reader == null || ! reader.HasRows)
                    {
                        using (var command2 = new OracleCommand(content) { Connection = oracleConnection })
                        {
                            command2.CommandType = CommandType.Text;
                            command2.ExecuteNonQuery();
                        }
                    }
                }

            }
        }
    }
}
/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.Helpers
{

    /// <summary>
    /// Summary description for RunScript
    /// A abstract base class for Run a Script file in Database server
    /// Inherit this class and override the Run() method to run script file
    /// </summary>
    public abstract class RunScript
    {
        protected string filename;
        protected string connectionString;

        /// <summary>
        /// Constructor of the class
        /// </summary>
        /// <param name="connectionString">a connectionstring for the database server</param>
        /// <param name="filename">the sql script file full path</param>
        public RunScript(string connectionString, string filename)
        {
            this.filename = filename;
            this.connectionString = connectionString;
        }

        /// <summary>
        /// Abstract class,
        /// Override the Run() method for running a script file 
        /// </summary>
        public abstract void Run();
    }
}
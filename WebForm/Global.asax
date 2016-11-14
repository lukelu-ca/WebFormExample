<%@ Application Language="C#" %>

<script RunAt="server">
    /*
     * Author: Luke Lu
     * Student ID: 300804279
     * Course: COMP 229
     */
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        //Application["recipes"] = new List<WebForm.Model.Recipe>();
        //string provider = ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName;
        //string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //WebForm.Helpers.RunScript runScript = null;
        //if (provider.ToLower().Contains("oracle"))
        //{
        //    runScript = new WebForm.Helpers.RunScriptOracle(connectionString, Server.MapPath("~/SQLScript/Oracle.sql"));
        //}
        //else if (provider.ToLower().Contains("sqlserver"))
        //{
        //    runScript = new WebForm.Helpers.RunScriptSQLServer(connectionString, Server.MapPath("~/SQLScript/SQLServer.sql"));
        //}
        //if (runScript != null)
        //{
        //    runScript.Run();
        //}

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        if (Session["Theme"] == null) Session["Theme"] = "Dark";
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>

<%@ Application Language="C#" %>

<script RunAt="server">
    /*
     * Author: Luke Lu
     * Student ID: 300804279
     * Course: COMP 229
     */
    void Application_Start(object sender, EventArgs e)
    {
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
        //get appsetting store to session
        if (Session["CurrentConnectionStringName"] == null) Session["CurrentConnectionStringName"] = ConfigurationManager.AppSettings["DefaultConnectionStringName"];
        //indicate CurrentConnectionStringName was changed
        Session["CurrentConnectionStringNameChanged"] = true;
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>


Partial Class test
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        My.Computer.FileSystem.RenameFile(ConfigurationManager.AppSettings("bannerunc").ToString() & "test.txt", "testdone.txt")
       

    End Sub
End Class

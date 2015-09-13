Imports System.Data
Imports System.Data.Odbc
Imports MySql.Data.MySqlClient
Public Class InvoiceConfig
    'Private Const CONNECTION_STRING As String = "DATABASE=farm;Driver=MySQL ODBC 3.51 Driver;OPTION=0;PORT=0;SERVER=chome;UID=app;password=gonow"
    'Private Const CONNECTION_STRING As String = "Data Source=cmain; Database=farm; User Id=app; Allow Zero Datetime=true; Password=gonow;"

    Private Const CONNECTION_STRING As String = "Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=KINDERKRAFT5"
    Private Const DATATABLE_NAME As String = "Invoice"
    Private DIRECTORY_FILE_PATH As String
    Dim vorderid As String
    Dim defaultcmd As String = "SELECT distinct cust.custid,cust.fname,cust.lname,cust.sfname,cust.slname,cust.saddr1,cust.saddr2,cust.scity,cust.sstate,cust.spostalcode,emailaddress,companyname,cust.billingaddr1,cust.billingaddr2,cust.city,cust.state,cust.postalcode,orders.orderid," _
    & "orders.subtot,orders.discountamt,orders.promocode,orders.semailaddress,orders.orderdate,orders.shipmethod,orders.shpchrg,orders.tax,orders.ordernotes,orders.total,orderdetail.productname,orderdetail.productcode,orderdetail.quantity," _
    & "orderdetail.prodprice,orderdetail.totalprice,orderdetail.opdesc FROM orderdetail left join orderoptions on orderdetail.orderdetailid=orderoptions.detailid" _
    & " left join orders on orders.orderid=orderdetail.orderid right join cust on orders.customerid=cust.custid where orders.orderid=1;"
    Public Sub New(ByVal datapath As String)
        MyBase.New()
        DIRECTORY_FILE_PATH = datapath


    End Sub
    Public ReadOnly Property InvoiceDataSet() As DataSet

        Get
            'For use with strong typed datasets
            'Dim myDataSet As CustomerDataSetSchema = New CustomerDataSetSchema()
            'For projects that use the generic DataSet class in Visual Studio 2005 Web Sites, within the get clause of the CustomerDataSet property,
            ' declare and instantiate a DataSet class, and then apply the XML Schema to the DataSet instance. That is, pass the directory file path to 
            'the CustomerDataSetSchema.xsd as a string parameter to the ReadXmlSchema() method of the DataSet instance.

            Dim cmd As String = "SELECT distinct cust.custid,cust.fname,cust.lname,cust.sfname,cust.slname,cust.saddr1,cust.saddr2,cust.scity,cust.sstate,cust.spostalcode,emailaddress,companyname,cust.billingaddr1,cust.billingaddr2,cust.city,cust.state,cust.postalcode,orders.orderid," _
       & "orders.subtot,orders.discountamt,orders.promocode,orders.paytype,orders.semailaddress,orders.orderdate,orders.shipmethod,orders.shpchrg,orders.tax,orders.ordernotes,orders.total,orderdetail.productname,orderdetail.productcode,orderdetail.quantity," _
       & "orderdetail.prodprice,orderdetail.totalprice,orderdetail.opdesc FROM orderdetail left join orderoptions on orderdetail.orderdetailid=orderoptions.detailid" _
       & " left join orders on orders.orderid=orderdetail.orderid right join cust on orders.customerid=cust.custid where orders.orderid=" & orderid & ";"

            Dim myDataSet As DataSet = New DataSet()
            myDataSet.ReadXmlSchema(DIRECTORY_FILE_PATH & "Invoice.xsd")
            Dim MySqlConnection As New MySqlConnection(CONNECTION_STRING)
            'if cmd string is empty use default command. Needed for postbacks from calling page.
            Dim MySqlAdapterCust As MySqlDataAdapter = New MySqlDataAdapter(IIf(String.IsNullOrEmpty(orderid), defaultcmd, cmd), MySqlConnection)
            myDataSet.Clear()
            MySqlAdapterCust.Fill(myDataSet, DATATABLE_NAME)
            Return myDataSet

        End Get
    End Property
    Public Property orderid() As String
        Get
            Return vorderid
        End Get
        Set(ByVal value As String)
            vorderid = value
        End Set
    End Property
End Class

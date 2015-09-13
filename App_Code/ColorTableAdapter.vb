Imports Microsoft.VisualBasic

Namespace CarsTableAdapters
    Class ColorTableAdapter

        Private _getColorsForModel As Cars.ColorDataTable

        Property GetColorsForModel(modelId As Integer) As Cars.ColorDataTable
            Get
                Return _getColorsForModel
            End Get
            Set(value As Cars.ColorDataTable)
                _getColorsForModel = value
            End Set
        End Property

    End Class
End Namespace

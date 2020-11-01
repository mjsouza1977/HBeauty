object ControllerConexao: TControllerConexao
  OldCreateOrder = False
  Height = 581
  Width = 784
  object qryQuery: TFDQuery
    Connection = Conexao
    Left = 192
    Top = 64
  end
  object qryQueryAux: TFDQuery
    Connection = Conexao
    Left = 192
    Top = 120
  end
  object FDStanStorageBinLink2: TFDStanStorageBinLink
    Left = 548
    Top = 140
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 548
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 548
    Top = 293
  end
  object FDPhysFBDriverLink2: TFDPhysFBDriverLink
    VendorHome = 'C:\Program Files (x86)\Firebird\Firebird_2_5\'
    VendorLib = 'fbclient.dll'
    Left = 556
    Top = 212
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=C:\Projetos\HBeauty\trunk\bd\HBEAUTY.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 548
    Top = 368
  end
end

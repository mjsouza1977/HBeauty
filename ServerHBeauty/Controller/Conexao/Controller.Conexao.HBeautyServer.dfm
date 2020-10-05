object ControllerConexao: TControllerConexao
  OldCreateOrder = False
  Height = 256
  Width = 445
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=E:\Projetos\HBeauty\trunk\bd\HBEAUTY.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 68
    Top = 118
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorHome = 'C:\Program Files (x86)\Firebird\Firebird_2_5'
    VendorLib = 'fbClient.dll'
    Left = 68
    Top = 172
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 68
    Top = 64
  end
end

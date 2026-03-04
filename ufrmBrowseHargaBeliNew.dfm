inherited frmBrowseHargaBeliNew: TfrmBrowseHargaBeliNew
  Left = 393
  Top = 183
  Caption = 'Browse Harga beli New'
  OldCreateOrder = True
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    FullHeight = 0
    inherited cxButton1: TcxButton
      Visible = False
    end
    inherited cxButton2: TcxButton
      Visible = False
      OnClick = cxButton2Click
    end
    inherited cxButton3: TcxButton
      Visible = False
    end
    inherited cxButton4: TcxButton
      Visible = False
    end
    inherited cxButton6: TcxButton
      Visible = False
    end
    object cxButton5: TcxButton
      Left = 538
      Top = 2
      Width = 75
      Height = 32
      Caption = 'Proses'
      TabOrder = 7
      OnClick = cxButton5Click
      Align = alLeft
    end
  end
  inherited AdvPanel2: TAdvPanel
    FullHeight = 0
  end
  inherited AdvPanel3: TAdvPanel
    FullHeight = 0
  end
  object MyConnection1: TMyConnection
    Database = 'bsm'
    Username = 'root'
    Password = 'Zainal_12345'
    Server = '156.67.219.209'
    Connected = True
    LoginPrompt = False
    Left = 240
    Top = 129
  end
end

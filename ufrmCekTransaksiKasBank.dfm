inherited frmCekTransaksiKasBank: TfrmCekTransaksiKasBank
  Left = 374
  Top = 152
  Caption = 'Cek Transaksi Kas dan Bank'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    FullHeight = 0
    inherited cxButton1: TcxButton
      Visible = False
    end
    inherited cxButton2: TcxButton
      Visible = False
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
  end
  inherited AdvPanel2: TAdvPanel
    Height = 41
    FullHeight = 0
    inherited Label2: TLabel
      Left = 235
      Top = 12
    end
    inherited btnRefresh: TcxButton
      Height = 37
      Caption = 'Refresh'
    end
    inherited startdate: TDateTimePicker
      Left = 83
      Top = 7
    end
    inherited enddate: TDateTimePicker
      Left = 259
      Top = 7
    end
  end
  inherited AdvPanel3: TAdvPanel
    Top = 41
    Height = 399
    FullHeight = 0
    inherited cxGrid: TcxGrid
      Height = 395
      inherited cxGrdMaster: TcxGridDBTableView
        PopupMenu = PopupMenu1
        OptionsView.Footer = True
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 217
    object LihatFakturPenjualan1: TMenuItem
      Caption = 'Lihat Detail'
    end
  end
end

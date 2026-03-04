inherited frmCekMutasiBarang: TfrmCekMutasiBarang
  Left = 432
  Top = 136
  Caption = 'Cek Mutasi  Barang'
  OldCreateOrder = True
  OnCreate = FormCreate
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
  end
  inherited AdvPanel2: TAdvPanel
    Height = 57
    FullHeight = 0
    inherited Label1: TLabel
      Top = 13
      Width = 39
      Caption = 'Periode '
    end
    inherited Label2: TLabel
      Left = 230
      Top = 13
      Width = 13
      Caption = 'Sd'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 34
      Width = 20
      Height = 13
      Caption = 'Asal'
    end
    object Label4: TLabel [3]
      Left = 231
      Top = 34
      Width = 33
      Height = 13
      Caption = 'Tujuan'
    end
    inherited btnRefresh: TcxButton
      Height = 53
    end
    inherited startdate: TDateTimePicker
      Left = 58
      Top = 9
      Width = 156
    end
    inherited enddate: TDateTimePicker
      Left = 282
      Top = 9
      Width = 157
    end
    object cxLookupCabangTujuan: TcxExtLookupComboBox
      Left = 283
      Top = 31
      Properties.ImmediatePost = True
      Style.Color = clWindow
      Style.LookAndFeel.Kind = lfFlat
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Width = 156
    end
    object cxLookupCabangAsal: TcxExtLookupComboBox
      Left = 59
      Top = 31
      Properties.ImmediatePost = True
      Style.Color = clWindow
      Style.LookAndFeel.Kind = lfFlat
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 156
    end
  end
  inherited AdvPanel3: TAdvPanel
    Top = 57
    Height = 383
    FullHeight = 0
    inherited cxGrid: TcxGrid
      Height = 379
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

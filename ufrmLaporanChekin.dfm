inherited frmLaporanChekin: TfrmLaporanChekin
  Top = 139
  Caption = 'Laporan ChekIn'
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
      Left = 328
      Top = 58
      Visible = False
    end
    object Label3: TLabel [2]
      Left = 259
      Top = 10
      Width = 11
      Height = 13
      Caption = 'sd'
    end
    inherited btnRefresh: TcxButton
      Height = 37
    end
    inherited startdate: TDateTimePicker
      Left = 88
      Top = 6
    end
    inherited enddate: TDateTimePicker
      Left = 296
      Top = 6
    end
    object cbbBulan: TAdvComboBox
      Left = 522
      Top = 7
      Width = 145
      Height = 21
      Color = clWindow
      AutoFocus = False
      ButtonWidth = 19
      Flat = True
      FlatLineColor = clBlack
      FlatParentColor = True
      Etched = False
      FocusBorder = False
      DropWidth = 0
      Enabled = True
      ItemHeight = 13
      Items.Strings = (
        'Januari'
        'Februari'
        'Maret'
        'April'
        'Mei'
        'Juni'
        'Juli'
        'Agustus'
        'September'
        'Oktober'
        'November'
        'Desember')
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 3
      Visible = False
    end
    object edtTahun: TComboBox
      Left = 492
      Top = 23
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = '2017'
      Visible = False
      Items.Strings = (
        '2016'
        '2017'
        '2018'
        '2019'
        '2020'
        '2021'
        '2022')
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

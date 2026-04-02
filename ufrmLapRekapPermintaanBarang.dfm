inherited frmLapRekapPermintaanBarang: TfrmLapRekapPermintaanBarang
  Left = 65
  Top = 88
  Caption = 'Laporan Rekap Permintaan Barang'
  ClientHeight = 599
  ClientWidth = 1386
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    Top = 563
    Width = 1386
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
    inherited cxButton8: TcxButton
      Left = 1297
    end
    object cxButton5: TcxButton
      Left = 538
      Top = 2
      Width = 105
      Height = 32
      Caption = 'Create PO'
      TabOrder = 7
      OnClick = cxButton5Click
      Align = alLeft
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00CE8C6300C6845200D68C6300E78C
        6B00DE8C6B00DE8C6B00D68C6B00CE8C6B00AD6B4200A55A2900FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00C6845200EFCEBD00DEFFFF0084EF
        C600A5F7D600A5F7D6008CEFC600E7FFFF00DEA58400AD6B3900DEB59400D69C
        7300D6946300CE946300CE8C5A00CE8C5A00C67B5200EFB59C00EFF7EF0052BD
        84006BCE940073CE9C0052BD8400E7F7EF00DE9C7B00AD6B3900D6A57300FFF7
        EF00F7F7EF00F7EFE700F7EFE700F7E7DE00C6845200EFB59400F7F7EF00EFF7
        E700EFF7E700EFF7E700EFF7E700F7F7EF00D69C7B00AD6B4200DEA57B00FFF7
        EF00EFD6BD00FFFFFF00EFD6BD00FFFFFF00CE8C6300E7B59400E7A58400E7A5
        8400DEA57B00DEA57B00DE9C7B00DE9C7300D69C7300BD7B5200DEA57B00FFF7
        EF00EFD6BD00EFD6BD00EFD6BD00EFD6BD00CE8C6300EFB59C00DEA57B00DEA5
        7B00DEA57B00DE9C7B00DE9C7B00DE9C7300DE9C7300BD845A00DEAD8400FFF7
        EF00EFCEB500FFFFFF00EFD6BD00FFFFFF00CE845A00EFBDA500FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEA58400C67B5200E7AD8400FFF7
        F700EFCEB500EFCEB500EFCEB500EFCEB500C6845A00EFBD9C00FFFFFF00CE94
        6B00FFFFFF00FFFFFF00FFFFF700FFFFF700E7AD8C00C68C6300E7B58C00FFF7
        F700EFCEAD00FFFFFF00EFCEAD00FFFFFF00CE8C6300F7CEAD00FFFFFF00E7C6
        B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFBDA500CE8C5A00E7B58C00FFF7
        F700EFC6AD00EFC6AD00EFC6AD00EFC6AD00D6946B00D69C7B00D6947300D6A5
        8400CE8C6300CE8C6B00D69C7300D69C7300CE8C6300EFDECE00E7B59400FFF7
        F700EFC6A500FFFFFF00EFC6AD00FFFFFF00FFFFFF00FFFFFF00EFC6AD00FFFF
        FF00FFFFFF00FFFFFF00F7F7EF00CE8C5A00FF00FF00FF00FF00EFBD9400FFF7
        F700EFC6A500EFC6A500EFC6A500EFC6A500EFC6A500EFC6A500EFC6A500EFC6
        A500EFC6A500EFC6A500FFF7F700CE946300FF00FF00FF00FF00EFBD9C00FFF7
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFF7F700D6946B00FF00FF00FF00FF00EFBD9C00FFF7
        F7009CD6A50094D6A50094D69C008CCE94008CCE940084CE8C0084C68C007BC6
        84007BC67B0073BD7B00FFF7F700D69C6B00FF00FF00FF00FF00EFC6A500FFF7
        F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
        F700FFF7F700FFF7F700FFF7F700DEA57300FF00FF00FF00FF00F7E7D600F7C6
        AD00EFBD9C00EFBD9C00EFBD9C00EFBD9400E7B59400E7B58C00E7B58C00E7AD
        8400E7AD8400DEAD7B00DEA57B00E7B59400FF00FF00FF00FF00}
      LookAndFeel.Kind = lfStandard
      LookAndFeel.SkinName = 'LondonLiquidSky'
    end
  end
  inherited AdvPanel2: TAdvPanel
    Width = 1386
    FullHeight = 0
    inherited Label1: TLabel
      Width = 71
      Caption = 'Tgl Permintaan'
    end
    inherited Label2: TLabel
      Visible = False
    end
    inherited btnRefresh: TcxButton
      Left = 1297
    end
    inherited startdate: TDateTimePicker
      Date = 46082.468570856480000000
      Time = 46082.468570856480000000
      Enabled = False
    end
    inherited enddate: TDateTimePicker
      Visible = False
    end
  end
  inherited AdvPanel3: TAdvPanel
    Width = 1386
    Height = 530
    FullHeight = 0
    inherited cxGrid: TcxGrid
      Width = 1382
      Height = 526
    end
    object cxGrid1: TcxGrid
      Left = 2
      Top = 2
      Width = 1382
      Height = 526
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGrdMain: TcxGridDBTableView
        PopupMenu = PopupMenu1
        NavigatorButtons.ConfirmDelete = False
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
          end
          item
            Format = ',0;(,0)'
            Kind = skSum
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnHiding = True
        OptionsData.Appending = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 23
        object clNo: TcxGridDBColumn
          DataBinding.FieldName = 'No'
          PropertiesClassName = 'TcxSpinEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 36
        end
        object clSKU: TcxGridDBColumn
          Caption = 'Kode'
          DataBinding.FieldName = 'kode'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 95
        end
        object clNamaBarang: TcxGridDBColumn
          Caption = 'Nama Barang'
          DataBinding.FieldName = 'nama'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 210
        end
        object clSatuan: TcxGridDBColumn
          Caption = 'Kode_Supplier'
          DataBinding.FieldName = 'kode_supplier'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 88
        end
        object clStok: TcxGridDBColumn
          Caption = 'Nama Supplier'
          DataBinding.FieldName = 'Supplier'
          PropertiesClassName = 'TcxSpinEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 145
        end
        object clminstok: TcxGridDBColumn
          DataBinding.FieldName = 'Solo'
          PropertiesClassName = 'TcxSpinEditProperties'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
        end
        object clharga: TcxGridDBColumn
          Caption = 'Jogja'
          DataBinding.FieldName = 'jogja'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 85
        end
        object clQtyPO: TcxGridDBColumn
          Caption = 'Madiun'
          DataBinding.FieldName = 'madiun'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 85
        end
        object cxGrdMainColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'Purwokerto'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Width = 66
        end
        object cxGrdMainColumn3: TcxGridDBColumn
          DataBinding.FieldName = 'Semarang'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGrdMainColumn4: TcxGridDBColumn
          DataBinding.FieldName = 'Surabaya'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGrdMainColumn5: TcxGridDBColumn
          DataBinding.FieldName = 'Cirebon'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGrdMainColumn6: TcxGridDBColumn
          Caption = 'Lab'
          DataBinding.FieldName = 'lab'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGrdMainColumn7: TcxGridDBColumn
          DataBinding.FieldName = 'Jakarta'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGrdMainColumn8: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'total'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGrdMainColumn9: TcxGridDBColumn
          DataBinding.FieldName = 'Stok'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGrdMainColumn10: TcxGridDBColumn
          Caption = 'Sisa'
          DataBinding.FieldName = 'sisa'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGrdMainColumn11: TcxGridDBColumn
          Caption = 'Order'
          DataBinding.FieldName = 'order'
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Styles.Content = cxStyle1
        end
        object cxGrdMainColumn2: TcxGridDBColumn
          Caption = 'Stok Cabang'
          DataBinding.FieldName = 'stokcabang'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;(,0.)'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 102
        end
        object cxGrdMainColumn12: TcxGridDBColumn
          Caption = 'PO Pending'
          DataBinding.FieldName = 'popending'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;(,0.)'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
      end
      object cxGridDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
      end
      object cxGridLevel1: TcxGridLevel
        Caption = 'Master Data'
        GridView = cxGrdMain
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clAqua
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 1160
    Top = 89
    object LihatDetailStokdanTOR1: TMenuItem
      Caption = 'Lihat Detail  Stok dan TOR'
      OnClick = LihatDetailStokdanTOR1Click
    end
  end
end

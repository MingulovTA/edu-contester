object Form3: TForm3
  Left = 45
  Top = 34
  BorderStyle = bsDialog
  Caption = 'Form3'
  ClientHeight = 226
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 114
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1086#1087#1088#1086#1089#1086#1074':'
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 104
    Height = 13
    Caption = #1059#1088#1086#1074#1077#1085#1100' '#1089#1083#1086#1078#1085#1086#1089#1090#1080':'
  end
  object Label3: TLabel
    Left = 168
    Top = 32
    Width = 108
    Height = 13
    Caption = #1059#1076#1086#1074#1083#1077#1090#1074#1086#1088#1080#1090#1077#1083#1100#1085#1086':'
  end
  object Label4: TLabel
    Left = 168
    Top = 80
    Width = 42
    Height = 13
    Caption = #1061#1086#1088#1086#1096#1086':'
  end
  object Label5: TLabel
    Left = 168
    Top = 128
    Width = 48
    Height = 13
    Caption = #1054#1090#1083#1080#1095#1085#1086':'
  end
  object Label6: TLabel
    Left = 168
    Top = 8
    Width = 110
    Height = 13
    Caption = #1055#1086#1088#1086#1075#1086#1074#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DxDiag: TButton
    Left = 48
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 176
    Top = 184
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 32
    Top = 48
    Width = 113
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = #1042#1089#1077
    Items.Strings = (
      #1042#1089#1077
      '30')
  end
  object ComboBox2: TComboBox
    Left = 32
    Top = 96
    Width = 113
    Height = 21
    Hint = #1042#1083#1080#1103#1077#1090' '#1085#1072' '#1087#1086#1076#1089#1082#1072#1079#1082#1080' '#1080' '#1089#1087#1080#1089#1086#1082' '#1074#1086#1087#1088#1086#1089#1086#1074
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = #1060#1077#1090#1080#1096
    Items.Strings = (
      #1060#1077#1090#1080#1096
      #1061#1072#1088#1076#1082#1086#1088)
  end
  object ComboBox3: TComboBox
    Left = 168
    Top = 48
    Width = 113
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 7
    TabOrder = 4
    Text = '40'
    Items.Strings = (
      '5'
      '10'
      '15'
      '20'
      '25'
      '30'
      '35'
      '40'
      '45'
      '50'
      '55'
      '60'
      '65'
      '70'
      '75'
      '80'
      '85'
      '90')
  end
  object ComboBox4: TComboBox
    Left = 168
    Top = 96
    Width = 113
    Height = 21
    Hint = #1042#1083#1080#1103#1077#1090' '#1085#1072' '#1087#1086#1076#1089#1082#1072#1079#1082#1080' '#1080' '#1089#1087#1080#1089#1086#1082' '#1074#1086#1087#1088#1086#1089#1086#1074
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 11
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = '60'
    Items.Strings = (
      '5'
      '10'
      '15'
      '20'
      '25'
      '30'
      '35'
      '40'
      '45'
      '50'
      '55'
      '60'
      '65'
      '70'
      '75'
      '80'
      '85'
      '90')
  end
  object ComboBox5: TComboBox
    Left = 168
    Top = 144
    Width = 113
    Height = 21
    Hint = #1042#1083#1080#1103#1077#1090' '#1085#1072' '#1087#1086#1076#1089#1082#1072#1079#1082#1080' '#1080' '#1089#1087#1080#1089#1086#1082' '#1074#1086#1087#1088#1086#1089#1086#1074
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 15
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = '80'
    Items.Strings = (
      '5'
      '10'
      '15'
      '20'
      '25'
      '30'
      '35'
      '40'
      '45'
      '50'
      '55'
      '60'
      '65'
      '70'
      '75'
      '80'
      '85'
      '90')
  end
end

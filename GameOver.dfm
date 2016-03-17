object Form2: TForm2
  Left = 496
  Top = 299
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  ClientHeight = 216
  ClientWidth = 487
  Color = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 80
    Top = 35
    Width = 323
    Height = 47
    Alignment = taCenter
    Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088' '#1074#1099#1081#1075#1088#1072#1083':('
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe Print'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 80
    Top = 128
    Width = 89
    Height = 33
    Caption = #1053#1086#1074#1072#1103' '#1080#1075#1088#1072
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 128
    Width = 89
    Height = 33
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 1
    OnClick = Button2Click
  end
end

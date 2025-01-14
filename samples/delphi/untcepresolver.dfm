object frmCepResolver: TfrmCepResolver
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cep Resolver'
  ClientHeight = 328
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object panHeader: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 81
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvNone
    Caption = 'panHeader'
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 438
    object labCep: TLabel
      Left = 10
      Top = 15
      Width = 24
      Height = 15
      Caption = 'CEP:'
    end
    object btnBuscarCep: TButton
      Left = 263
      Top = 9
      Width = 172
      Height = 66
      Caption = 'Buscar CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnBuscarCepClick
    end
    object rdgApi: TRadioGroup
      Left = 10
      Top = 40
      Width = 247
      Height = 35
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Via Cep'
        'Open Cep')
      TabOrder = 1
    end
    object edtCep: TEdit
      Left = 40
      Top = 12
      Width = 217
      Height = 23
      TabOrder = 2
      OnKeyPress = edtCepKeyPress
    end
  end
  object panBody: TPanel
    Left = 0
    Top = 81
    Width = 442
    Height = 247
    Align = alClient
    Caption = 'panBody'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 438
    ExplicitHeight = 246
    object edtLogradouro: TLabeledEdit
      Left = 10
      Top = 27
      Width = 425
      Height = 23
      Color = clBtnFace
      EditLabel.Width = 62
      EditLabel.Height = 15
      EditLabel.Caption = 'Logradouro'
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object edtBairro: TLabeledEdit
      Left = 10
      Top = 75
      Width = 425
      Height = 23
      Color = clBtnFace
      EditLabel.Width = 31
      EditLabel.Height = 15
      EditLabel.Caption = 'Bairro'
      ReadOnly = True
      TabOrder = 1
      Text = ''
    end
    object edtComplemento: TLabeledEdit
      Left = 10
      Top = 122
      Width = 425
      Height = 23
      Color = clBtnFace
      EditLabel.Width = 77
      EditLabel.Height = 15
      EditLabel.Caption = 'Complemento'
      ReadOnly = True
      TabOrder = 2
      Text = ''
    end
    object edtCidade: TLabeledEdit
      Left = 10
      Top = 167
      Width = 371
      Height = 23
      Color = clBtnFace
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cidade'
      ReadOnly = True
      TabOrder = 3
      Text = ''
    end
    object edtUf: TEdit
      Left = 392
      Top = 167
      Width = 43
      Height = 23
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edtIbge: TLabeledEdit
      Left = 10
      Top = 212
      Width = 425
      Height = 23
      Color = clBtnFace
      EditLabel.Width = 23
      EditLabel.Height = 15
      EditLabel.Caption = 'Ibge'
      ReadOnly = True
      TabOrder = 5
      Text = ''
    end
  end
end

unit EdProcura;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Messages,
  Vcl.Dialogs, Vcl.Forms, Vcl.ExtCtrls;

type
  TCustomEdProcura = class(TCustomPanel)
  private
    fCampo: TEdit;
    fMostrar: TEdit;
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;
     procedure OnExit(Sender: TObject) ;
     procedure OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState) ;
     procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
     procedure Alinhar();
  published
    property Campo: TEdit read fCampo write fCampo;
    property Mostrar: TEdit read fMostrar write fMostrar;
  end;

type
  TEdProcura = class(TCustomEdProcura)

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Exemplos', [TEdProcura]);
end;

{ TEdProcura }

procedure TCustomEdProcura.Alinhar;
begin
  fMostrar.Left := fCampo.Left + fCampo.Width + 2;
  Update;
end;

constructor TCustomEdProcura.Create(AOwner: TComponent);
begin
  inherited  Create(AOwner);

  Self.Visible := True;

  fCampo := TEdit.Create(Self);
  fCampo.SetSubComponent(True);
  fCampo.Name := 'EditCampo';
  fCampo.Text := '';
  fCampo.CharCase := ecUpperCase;
  fCampo.Font.Name := 'Arial';
  fCampo.Visible := True;
  fCampo.Width := 57;
  fCampo.OnExit := OnExit;
  fCampo.ReadOnly := false;
  fCampo.OnKeyDown := OnKeyDown;
  fCampo.BevelKind := bkNone;
  fCampo.BorderStyle := bsSingle;
//  InsertControl(fCampo);

  fMostrar := TEdit.Create(Self);
  fMostrar.SetSubComponent(True);
  fMostrar.Name := 'EditMostrar';
  fMostrar.Text := '';
  fMostrar.CharCase := ecUpperCase;
  fMostrar.Visible := True;
  fMostrar.Enabled := false;
  fMostrar.Width := 233;
  fMostrar.ReadOnly := false;
  fMostrar.BorderStyle := bsSingle;

  Alinhar();
//  InsertControl(fMostrar);
end;

destructor TCustomEdProcura.Destroy;
begin
  fMostrar.Free;
  fCampo.Free;
end;

procedure TCustomEdProcura.OnExit(Sender: TObject);
begin
  if Campo.Text = '' then
  begin
    MessageDlg('Valor n�o pode estar vazio...',mtInformation,[mbOk],0);
    Campo.SetFocus;
  end;
end;

procedure TCustomEdProcura.OnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//   if Key '#13' then
//     MessageDlg('Pressionou Enter...',mtInformation,[mbOk],0);
end;

procedure TCustomEdProcura.WMPaint(var Message: TWMPaint);
begin
  inherited;
  Alinhar();
end;

end.

unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sEdit, Vcl.OleCtrls,
  SHDocVw, acWebBrowser;

type
  TForm2 = class(TForm)
    swbrwsr1: TsWebBrowser;
    edt1: TsEdit;
    procedure swbrwsr1NavigateComplete2(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
 //3612440
implementation

{$R *.dfm}
 uses Unit1;
procedure TForm2.swbrwsr1NavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
  var code:string;
begin
edt1.Text:=URL;
if Copy(url,1,47)='https://oauth.yandex.ru/verification_code?code='  then
begin
   code:= Copy(url,50,7);
   OnGetAuthCode(code);
   form2.Hide;
end;

end;
//https://oauth.yandex.ru/verification_code?code=3754456
end.

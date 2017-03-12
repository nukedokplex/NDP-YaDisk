unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, sSkinManager, Unit2,
  IPPeerClient, Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,
  Vcl.StdCtrls, sButton;
const
  client_id='af89203acafc4ecfbe4a0be8779dd725';
type
  TForm1 = class(TForm)
    sknmngr1: TsSkinManager;
    mm1: TMainMenu;
    K1: TMenuItem;
    L1: TMenuItem;
    L2: TMenuItem;
    rstclnt1: TRESTClient;
    btn1: TsButton;
    procedure L1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.L1Click(Sender: TObject);
begin
   Form2.Show;
   form2.swbrwsr1.Navigate('https://oauth.yandex.ru/authorize?response_type=code&client_id='+client_id);
end;

end.

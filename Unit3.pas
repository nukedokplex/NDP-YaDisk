unit Unit3;

interface

uses
  System.Classes,IdHTTP, IdSSLOpenSSL;

type
  postcall = class(TThread)
  private

  protected
    procedure Execute; override;
  public
    code:string;
    OnHaltProc:procedure(response:string);
  end;

implementation


procedure postcall.Execute;
var
  http:TIdHTTP;
  handler:TIdSSLIOHandlerSocketOpenSSL;
  PostData:TStringList;
  response:string;
begin
  http:=TIdHTTP.Create;
  handler:=TIdSSLIOHandlerSocketOpenSSL.Create;
  http.IOHandler:=handler;
  PostData.Add('grant_type=authorization_code');
  PostData.Add('code='+code);
  response:=http.Post('oauth.yandex.ru', PostData);
  PostData.Free;
  handler.Free;
  http.Free;
  OnHaltProc(response);
end;

end.

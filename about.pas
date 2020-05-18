unit About;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TForm_About }

  TForm_About = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form_About: TForm_About;

implementation

{$R *.lfm}

{ TForm_About }

procedure TForm_About.BitBtn1Click(Sender: TObject);
begin
    Close;
end;
procedure TForm_About.FormShow(Sender: TObject);
begin
  Label1.Caption := 'ЛР1. Простой текстовый' + #10 + 'редактор, v. 1.0';
  Label2.Caption := '© Бондарчук Н., 4ПМИ';
  Memo1.Caption := 'Программа для создания и редактирования файлов в формате .txt.'
end;

end.


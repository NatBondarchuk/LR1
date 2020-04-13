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
    Panel1: TPanel;
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
  Label1.Text := 'ЛР1. Простой текстовый редактор';
  Label2.Text := 'Автор: Бондарчук Наталья, 4ПМИ';
  Memo1.Text := '...';
end;

end.


unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtDlgs, ComCtrls, ExtCtrls, SynHighlighterPas, SynHighlighterCpp,
  SynHighlighterJScript, SynHighlighterCss, SynMemo, SynEdit, SynHighlighterAny;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Find_item: TFindDialog;
    Font_item: TFontDialog;
    MainMenu1: TMainMenu;
    Theme_light: TMenuItem;
    Theme_dark: TMenuItem;
    Theme_standart: TMenuItem;
    Menu_Cpp: TMenuItem;
    Menu_JS: TMenuItem;
    Menu_CSS: TMenuItem;
    Menu_none: TMenuItem;
    Menu_File: TMenuItem;
    Menu_Close: TMenuItem;
    Menu_Exite: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    Menu_Font: TMenuItem;
    Menu_Theme: TMenuItem;
    Menu_Found: TMenuItem;
    Menu_Replace: TMenuItem;
    Menu_Edit: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    Menu_Syn: TMenuItem;
    N1: TMenuItem;
    Menu_View: TMenuItem;
    Menu_Search: TMenuItem;
    MenuItem5: TMenuItem;
    Menu_Create: TMenuItem;
    Menu_Open: TMenuItem;
    Menu_Save: TMenuItem;
    Menu_SaveAs: TMenuItem;
    Open_item: TOpenDialog;
    Replace_item: TReplaceDialog;
    Save_item: TSaveDialog;
    StatusBar1: TStatusBar;
    Syn_Any: TSynAnySyn;
    SynEdit1: TSynEdit;
    Syn_Cpp: TSynCppSyn;
    Syn_CSS: TSynCssSyn;
    Syn_JS: TSynJScriptSyn;
    Timer1: TTimer;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Menu_CppClick(Sender: TObject);
    procedure Menu_CSSClick(Sender: TObject);
    procedure Menu_ExiteClick(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure Menu_FontClick(Sender: TObject);
    procedure Menu_CreateClick(Sender: TObject);
    procedure Menu_JSClick(Sender: TObject);
    procedure Menu_noneClick(Sender: TObject);
    procedure Menu_OpenClick(Sender: TObject);
    procedure Menu_ReplaceClick(Sender: TObject);
    procedure Menu_SaveClick(Sender: TObject);
    procedure Menu_SaveAsClick(Sender: TObject);
    procedure StatusBar1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure SynEdit1Change(Sender: TObject);
    procedure SynEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure SynEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SynEdit1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SynEdit1StartDock(Sender: TObject; var DragObject: TDragDockObject
      );
    procedure Theme_darkClick(Sender: TObject);
    procedure Theme_lightClick(Sender: TObject);
    procedure Theme_standartClick(Sender: TObject);
    procedure Timer1StartTimer(Sender: TObject);
    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  FileWork: string;

implementation

{$R *.lfm}
Procedure SaveAs;
begin
  if form1.Save_Item.Execute then
  begin
    form1.SynEdit1.Lines.SaveToFile(Form1.Save_Item.FileName);
    FileWork:=Form1.Save_Item.FileName;
  end;
end;

{ TForm1 }

procedure TForm1.Menu_ExiteClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY+1) + ':'+ IntToStr (SynEdit1.CaretX+1);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY)+':'+IntToStr (SynEdit1.CaretX);
  SynEdit1.Text:='';
end;

procedure TForm1.Menu_CppClick(Sender: TObject);
begin
     if Menu_Cpp.Checked=true then
    begin
      Form1.SynEdit1.Highlighter:=Syn_Cpp;
    end;
end;

procedure TForm1.Menu_CSSClick(Sender: TObject);
begin
    if Menu_CSS.Checked=true then
    begin
      Form1.SynEdit1.Highlighter:=Syn_CSS;
    end;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  SynEdit1.SelectAll;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  SynEdit1.CutToClipBoard;
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  SynEdit1.CopyToClipboard;
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  SynEdit1.PasteFromClipboard;
end;

procedure TForm1.Menu_FontClick(Sender: TObject);
begin
  if Font_item.Execute then SynEdit1.Font:=Font_item.Font;
end;

procedure TForm1.Menu_CreateClick(Sender: TObject);
begin
  FileWork:='';
  SynEdit1.Clear;
end;

procedure TForm1.Menu_JSClick(Sender: TObject);
begin
  if Menu_JS.Checked=true then
    begin
      Form1.SynEdit1.Highlighter:=Syn_JS;
    end;
end;

procedure TForm1.Menu_noneClick(Sender: TObject);
begin
  if Menu_none.Checked=true then
    begin
      Form1.SynEdit1.Highlighter:=Syn_Any;
      Form1.SynEdit1.Font.Style:=[];
    end;
end;

procedure TForm1.Menu_OpenClick(Sender: TObject);
begin
  if Open_item.Execute then
  begin
    SynEdit1.Lines.LoadFromFile(Open_item.FileName);
    FileWork:=Open_item.FileName;
  end;
end;

procedure TForm1.Menu_ReplaceClick(Sender: TObject);
begin

end;

procedure TForm1.Menu_SaveClick(Sender: TObject);
begin
  If FileWork='' then SaveAs else SynEdit1.Lines.SaveToFile(FileWork);
end;

procedure TForm1.Menu_SaveAsClick(Sender: TObject);
begin
  SaveAs;
end;

procedure TForm1.StatusBar1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin

end;

procedure TForm1.SynEdit1Change(Sender: TObject);
begin

end;

procedure TForm1.SynEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY)+':'+IntToStr (SynEdit1.CaretX);
end;

procedure TForm1.SynEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY)+':'+IntToStr (SynEdit1.CaretX);
end;

procedure TForm1.SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY)+':'+IntToStr (SynEdit1.CaretX);
end;

procedure TForm1.SynEdit1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY)+':'+IntToStr(SynEdit1.CaretX);
end;

procedure TForm1.SynEdit1StartDock(Sender: TObject;
  var DragObject: TDragDockObject);
begin

end;

procedure TForm1.Theme_darkClick(Sender: TObject);
begin
     if Theme_dark.Checked=true then
     begin
          SynEdit1.Color:=clBlack;
          SynEdit1.Font.Color:=clWhite;
          SynEdit1.SelectedColor.Background:=clAqua;
          SynEdit1.SelectedColor.Foreground:=clBlack;
     end;
end;

procedure TForm1.Theme_lightClick(Sender: TObject);
begin
     if Theme_light.Checked=true then
     begin
          SynEdit1.Color:=clNavy ;
          SynEdit1.Font.Color:=clLime;
          SynEdit1.SelectedColor.Background:=clPurple;
          SynEdit1.SelectedColor.Foreground:=clWhite;
     end;
end;

procedure TForm1.Theme_standartClick(Sender: TObject);
begin
  if Theme_standart.Checked=true then
     begin
          SynEdit1.Color:=clDefault;
          SynEdit1.Font.Color:=clDefault;
     end;
end;

procedure TForm1.Timer1StartTimer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text:=DateToStr( Date ) + ' ' + TimeToStr( Time );
end;

procedure TForm1.Timer1StopTimer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text:=DateToStr( Date ) + ' ' + TimeToStr( Time );
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text:=DateToStr( Date ) + ' ' + TimeToStr( Time );
end;


end.


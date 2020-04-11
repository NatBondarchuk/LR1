unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtDlgs, ComCtrls, SynHighlighterPas, SynHighlighterCpp,
  SynHighlighterJScript, SynHighlighterCss, SynMemo, SynEdit, SynHighlighterAny;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Find_item: TFindDialog;
    Font_item: TFontDialog;
    MainMenu1: TMainMenu;
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
    Syn_Any: TSynAnySyn;
    SynEdit1: TSynEdit;
    Syn_Cpp: TSynCppSyn;
    Syn_CSS: TSynCssSyn;
    Syn_JS: TSynJScriptSyn;
    procedure Menu_CloseClick(Sender: TObject);
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
    procedure Menu_SaveClick(Sender: TObject);
    procedure Menu_SaveAsClick(Sender: TObject);
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

procedure TForm1.Menu_CloseClick(Sender: TObject);
begin

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
      Form1.SynEdit1.Highlighter:=Syn_Cpp;
      Form1.SynEdit1.Highlighter:=Syn_JS;
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

//procedure TForm1.MenuItem23Click(Sender: TObject);
//begin
//  if MenuItem23.Checked=true then
//    begin
//      Form1.Memo1.Highlighter:=Syn_Cpp;
//    end;
//end;

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

procedure TForm1.Menu_SaveClick(Sender: TObject);
begin
  If FileWork='' then SaveAs else SynEdit1.Lines.SaveToFile(FileWork);
end;

procedure TForm1.Menu_SaveAsClick(Sender: TObject);
begin
  SaveAs;
end;


end.


unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtDlgs, ComCtrls, ExtCtrls, SynHighlighterPas, SynHighlighterCpp,
  About, SynHighlighterJScript, SynHighlighterCss, SynMemo, SynEdit,
  SynHighlighterAny;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Find_item: TFindDialog;
    Font_item: TFontDialog;
    MainMenu1: TMainMenu;
    Menu_Lang: TMenuItem;
    Menu_RU: TMenuItem;
    Menu_EN: TMenuItem;
    Process1: TProcess;
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
    Menu_Ref: TMenuItem;
    Menu_About_pr: TMenuItem;
    Menu_Syn: TMenuItem;
    N1: TMenuItem;
    Menu_View: TMenuItem;
    Menu_Search: TMenuItem;
    Menu_About: TMenuItem;
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
    procedure Find_itemFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Menu_ENClick(Sender: TObject);
    procedure Menu_RefClick(Sender: TObject);
    procedure Menu_About_prClick(Sender: TObject);
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
    procedure Menu_FoundClick(Sender: TObject);
    procedure Menu_JSClick(Sender: TObject);
    procedure Menu_noneClick(Sender: TObject);
    procedure Menu_OpenClick(Sender: TObject);
    procedure Menu_ReplaceClick(Sender: TObject);
    procedure Menu_RUClick(Sender: TObject);
    procedure Menu_SaveClick(Sender: TObject);
    procedure Menu_SaveAsClick(Sender: TObject);
    procedure Replace_itemFind(Sender: TObject);
    procedure Replace_itemReplace(Sender: TObject);
    procedure SynEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure SynEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SynEdit1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Theme_darkClick(Sender: TObject);
    procedure Theme_lightClick(Sender: TObject);
    procedure Theme_standartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  FileWork: string;
  SPos: integer;

implementation
{$R *.lfm}

{___TFORM1___}

//______________________________________________________________Строка состояния
//Определение строка : символ первоначальное
procedure TForm1.FormShow(Sender: TObject);
begin

  SynEdit1.Text:='';
  if FileWork='' then
     Form1.Caption := 'ЛР 1. Тектовый редактор - Новый документ'
  else
      Form1.Caption := 'ЛР 1. Тектовый редактор - ' + FileWork;
  StatusBar1.Panels[0].Text := IntToStr(SynEdit1.CaretY) + ':' +
  IntToStr (SynEdit1.CaretX);
end;
//Пересчет строка : символ при нажатии "Вниз"
procedure TForm1.SynEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY) + ':' +
  IntToStr (SynEdit1.CaretX);
end;
//Пересчет строка : символ при нажатии "Вверх"
procedure TForm1.SynEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY) + ':' +
  IntToStr (SynEdit1.CaretX);
end;
//Пересчет строка : символ мышь вниз
procedure TForm1.SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY) + ':' +
  IntToStr (SynEdit1.CaretX);
end;
//Пересчет строка : символ мышь вверх
procedure TForm1.SynEdit1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StatusBar1.Panels[0].Text:=IntToStr(SynEdit1.CaretY) + ':' +
  IntToStr(SynEdit1.CaretX);
end;
//Дата + время
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text:=DateToStr( Date ) + ' ' + TimeToStr( Time );
end;
//__________________________________________________________________________МЕНЮ
//__________________________________________________________________________Файл
//Создать
procedure TForm1.Menu_CreateClick(Sender: TObject);
begin
  FileWork:='';
  SynEdit1.Clear;
  if FileWork='' then Form1.Caption :='ЛР 1. Тектовый редактор - Новый документ'
  else Form1.Caption := 'ЛР 1. Тектовый редактор - ' + FileWork;
end;
//открыть
procedure TForm1.Menu_OpenClick(Sender: TObject);
begin
  if Open_item.Execute then
  begin
    SynEdit1.Lines.LoadFromFile(Open_item.FileName);
    FileWork:=Open_item.FileName;
  end;
  if FileWork='' then Form1.Caption :='ЛР 1. Тектовый редактор - Новый документ'
  else Form1.Caption := 'ЛР 1. Тектовый редактор - ' + FileWork;
end;
//закрыть
procedure TForm1.Menu_CloseClick(Sender: TObject);
begin
  FileWork:='';
  SynEdit1.Clear;
  if FileWork='' then Form1.Caption :='ЛР 1. Тектовый редактор - Новый документ'
  else Form1.Caption := 'ЛР 1. Тектовый редактор - ' + FileWork;
end;
//процедура для сохранения
Procedure SaveAs;
begin
  if form1.Save_Item.Execute then
  begin
    form1.SynEdit1.Lines.SaveToFile(Form1.Save_Item.FileName);
    FileWork:=Form1.Save_Item.FileName;
  end;
end;
//сохранить
procedure TForm1.Menu_SaveClick(Sender: TObject);
begin
  If FileWork='' then SaveAs else SynEdit1.Lines.SaveToFile(FileWork);
end;
//сохранить как...
procedure TForm1.Menu_SaveAsClick(Sender: TObject);
begin
  SaveAs;
  if FileWork='' then Form1.Caption :='ЛР 1. Тектовый редактор - Новый документ'
  else Form1.Caption := 'ЛР 1. Тектовый редактор - ' + FileWork;
end;
//выход
procedure TForm1.Menu_ExiteClick(Sender: TObject);
begin
  close;
end;
//________________________________________________________________________Правка
//Выделить всё
procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  SynEdit1.SelectAll;
end;
//Вырезать
procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  SynEdit1.CutToClipBoard;
end;
//копировать
procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  SynEdit1.CopyToClipboard;
end;
//Вставить
procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  SynEdit1.PasteFromClipboard;
end;
//___________________________________________________________________________Вид
//__________________________________________________________подсветка синтаксиса
//С++
procedure TForm1.Menu_CppClick(Sender: TObject);
begin
     if Menu_Cpp.Checked=true then
    begin
      Form1.SynEdit1.Highlighter:=Syn_Cpp;
    end;
end;
//CSS
procedure TForm1.Menu_CSSClick(Sender: TObject);
begin
    if Menu_CSS.Checked=true then
    begin
      Form1.SynEdit1.Highlighter:=Syn_CSS;
    end;
end;
//JS
procedure TForm1.Menu_JSClick(Sender: TObject);
begin
  if Menu_JS.Checked=true then
    begin
      Form1.SynEdit1.Highlighter:=Syn_JS;
    end;
end;
//пдсветка синтаксиса отключена
procedure TForm1.Menu_noneClick(Sender: TObject);
begin
  if Menu_none.Checked=true then
    begin
      Form1.SynEdit1.Highlighter:=Syn_Any;
      Form1.SynEdit1.Font.Style:=[];
    end;
end;
//_______________________________________________________________темы оформления
//темная
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
//яркая
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
//стандартная
procedure TForm1.Theme_standartClick(Sender: TObject);
begin
  if Theme_standart.Checked=true then
     begin
          SynEdit1.Color:=clWhite;
          SynEdit1.Font.Color:=clBlack;
          SynEdit1.SelectedColor.Background:=clHighlight;
          SynEdit1.SelectedColor.Foreground:=clHighlightText;
     end;
end;
//________________________________________________________________________шрифты
procedure TForm1.Menu_FontClick(Sender: TObject);
begin
  if Font_item.Execute then SynEdit1.Font:=Font_item.Font;
end;
//_________________________________________________________________________ПОИСК
//Определение, что искать, запуск диалога
procedure TForm1.Menu_FoundClick(Sender: TObject);
begin
  SPos := SynEdit1.SelStart; //позиция курсора
  with Find_Item do
  begin
    FindText := SynEdit1.SelText;  //текст для поиска
    Execute;
  end;
end;
//Поиск с учетом/без учета регистра
procedure TForm1.Find_ItemFind(Sender: TObject);
  begin
  with Find_Item do
  begin
    if frMatchCase in Options then
        SynEdit1.SelStart := Pos(FindText, Copy(SynEdit1.Lines.Text,
        SPos + 1, Length(SynEdit1.Lines.Text))) + Spos
    else SynEdit1.SelStart := Pos(AnsiLowerCase(FindText),
         AnsiLowerCase(Copy(SynEdit1.Lines.Text, SPos + 1,
         Length(SynEdit1.Lines.Text))))+ Spos;
    if SynEdit1.SelStart >= Spos then
       begin
            SynEdit1.SelEnd := SynEdit1.SelStart+Length(FindText);
            SPos := SynEdit1.SelStart + Length(FindText) + 1;
       end
    else
       if MessageDlg('Текст "'+FindText+'" не найден. Продолжать диалог?',
          mtConfirmation, mbYesNoCancel, 0) <> mrYes then
          CloseDialog;
  end;
  SynEdit1.SetFocus;
end;
//________________________________________________________________________ЗАМЕНА
//Определение, что искать для замены, запуск диалога
procedure TForm1.Menu_ReplaceClick(Sender: TObject);
begin
  SPos := SynEdit1.SelStart; //позиция курсора
  with Replace_Item do
  begin
    ReplaceText := SynEdit1.SelText;  //текст для поиска
    Execute;
  end;
end;
//Поиск с учетом/без учета регистра
procedure TForm1.Replace_itemFind(Sender: TObject);
begin
  with Replace_Item do
  begin
    if frMatchCase in Options
       then SynEdit1.SelStart := Pos(FindText, Copy(SynEdit1.Lines.Text,
            SPos + 1, Length(SynEdit1.Lines.Text))) + Spos
       else SynEdit1.SelStart := Pos(AnsiLowerCase(FindText),
            AnsiLowerCase(Copy(SynEdit1.Lines.Text, SPos + 1,
            Length(SynEdit1.Lines.Text)))) + Spos;
       if SynEdit1.SelStart >= Spos then
          begin
               SynEdit1.SelEnd := SynEdit1.SelStart+Length(FindText);
               SPos := SynEdit1.SelStart + Length(FindText) + 1;
          end
       else
           if MessageDlg('Текст "'+FindText+'" не найден. Продолжать диалог?',
              mtConfirmation, mbYesNoCancel, 0) <> mrYes then
              CloseDialog;
  end;
  SynEdit1.SetFocus;
end;
//Замена
procedure TForm1.Replace_itemReplace(Sender: TObject);
begin
  if SynEdit1.SelText <> '' then SynEdit1.SelText := Replace_Item.ReplaceText;
  if frReplaceAll in Replace_Item.Options then Replace_ItemFind(Self);
end;
//_______________________________________________________________________СПРАВКА
//Справка
procedure TForm1.Menu_RefClick(Sender: TObject);
begin

end;
//О программе
procedure TForm1.Menu_About_prClick(Sender: TObject);
begin
   Form_About.ShowModal;
end;
//Язык интерфейса
procedure TForm1.Menu_RUClick(Sender: TObject);
begin
  if Menu_RU.Checked=true then
    begin
      Menu_File.Caption := 'Файл';
      Menu_Edit.Caption := 'Правка';
      Menu_View.Caption := 'Вид';
      Menu_Search.Caption := 'Поиск';
      Menu_About.Caption := 'Справка';
      Menu_Lang.Caption := 'Язык/Language';

      Menu_Create.Caption := 'Создать';
      Menu_Open.Caption := 'Открыть';
      Menu_Close.Caption := 'Закрыть';
      Menu_Save.Caption := 'Сохранить';
      Menu_SaveAs.Caption := 'Сохранить как...';
      Menu_Exite.Caption := 'Выход';

      MenuItem12.Caption := 'Выделить всё';
      MenuItem13.Caption := 'CВырезать';
      MenuItem14.Caption := 'Копировать';
      MenuItem15.Caption := 'Выставить';

      Menu_Font.Caption := 'Шрифт';
      Menu_Theme.Caption := 'Тема оформления';
      Theme_dark.Caption := 'Темная';
      Theme_light.Caption := 'Яркая';
      Theme_standart.Caption := 'Стндартная';
      Menu_Syn.Caption := 'Подсветка синтаксиса';
      Menu_none.Caption := 'нет';

      Menu_Found.Caption := 'Найти';
      Menu_Replace.Caption := 'Заменить';

      Menu_Ref.Caption := 'Справка';
      Menu_About_pr.Caption := 'О программе';
    end
end;
//English
procedure TForm1.Menu_ENClick(Sender: TObject);
begin
  if Menu_EN.Checked=true then
    begin
      Menu_File.Caption := 'File';
      Menu_Edit.Caption := 'Edit';
      Menu_View.Caption := 'View';
      Menu_Search.Caption := 'Search';
      Menu_About.Caption := 'Help';
      Menu_Lang.Caption := 'Language|Язык';

      Menu_Create.Caption := 'New';
      Menu_Open.Caption := 'Open';
      Menu_Close.Caption := 'Close';
      Menu_Save.Caption := 'Save';
      Menu_SaveAs.Caption := 'Save as...';
      Menu_Exite.Caption := 'Exit';

      MenuItem12.Caption := 'Select all';
      MenuItem13.Caption := 'Cut';
      MenuItem14.Caption := 'Copy';
      MenuItem15.Caption := 'Paste';

      Menu_Font.Caption := 'Font';
      Menu_Theme.Caption := 'Themes';
      Theme_dark.Caption := 'Dark';
      Theme_light.Caption := 'Light';
      Theme_standart.Caption := 'Standart';
      Menu_Syn.Caption := 'Syntax highlighting';
      Menu_none.Caption := 'none';

      Menu_Found.Caption := 'Find';
      Menu_Replace.Caption := 'Replace';

      Menu_Ref.Caption := 'Reference';
      Menu_About_pr.Caption := 'About program';
    end
end;
end.


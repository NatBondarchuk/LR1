unit Help;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, ActnList, Menus;

type

  { TFrmHelp }

  TFrmHelp = class(TForm)
    helpClose: TBitBtn;
    Label1: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FrmHelp: TFrmHelp;

implementation

{$R *.lfm}

{ TFrmHelp }

procedure TFrmHelp.FormCreate(Sender: TObject);
begin
    Memo1.Caption := 'В данной программе реализованы следующие требования:'#13
      + '  ¤ Интерфейс приложения на 2-х языках (русский и английский).'#13
      + '  ¤ Подсветка синтаксиса для 3-х языков программирования (CSS, JS, C++).'#13
      + '  ¤ Темы оформления (в количестве 3-х).'#13
      + '  ¤ Действующие пункты меню:'#13
      + '     ° Файл: Новый, Открыть, Закрыть (закрывается текущий файл и '#13
      + '                создается новый), Сохранить, Сохранить как, Выход'#13
      + '     ° Правка: Выделить все, Вырезать, Копировать, Вставить'#13
      + '     ° Вид: Шрифт, Тема оформления'#13
      + '     ° Поиск: Найти, Заменить'#13
      + '     ° Справка: Справка, О программе'#13
      + '  ¤ Строка состояния: отображение номера текущей строки, текущее время';

end;

end.


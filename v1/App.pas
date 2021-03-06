unit App;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    FBConnection: TSQLConnection;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SQLMonitor1: TSQLMonitor;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Button3: TButton;
    procedure FBConnectionAfterConnect(Sender: TObject);
    procedure FBConnectionAfterDisconnect(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    procedure Trace( const AMessage: string );
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  Base.CommandSQL,
  Base.BuilderSQL.Insert, System.DateUtils , Base.BuilderSQL.Delete, Base.Utils,
  Base.BuilderSQL.Update;

procedure TForm2.Trace(const AMessage: string);
begin
  Memo1.Lines.Add(
    FormatDateTime( 'hh:nn:ss', Now() ) +
    ' -> ' +
    AMessage );
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  SQL: string;
begin
 SQL:=
   TDeleteSQL.Builder()
     .AddTable( 'clientes' )
     .AddWhere( 'id', 1, topcompEqual ).GetSQL();

  Trace( SQL );

  FBConnection.ExecuteDirect( SQL );
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  SQL: string;
begin
  SQL:=
    TInsertSQL.Builder()
      .AddTable( 'clientes' )
      .AddField( 'id', 1 )
      .AddField( 'nome', 'Daniele Klein' )
      .AddField( 'valor_prestacao', 145.78 )
      .AddField( 'data_nascimento', StrToDateTime( '26/06/1989' ) )
      .AddField( 'data_cadastro', ( Now() ) )
      .AddField( 'hora_ultima_atualizacao', StrToDateTime( '05:09:08' ) )
      .GetSQL();

   Trace( SQL );
   FBConnection.ExecuteDirect( SQL );
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  SQL: string;
begin
  SQL:=
    TUpdateSQL.Builder()
      .AddTable( 'clientes' )
      .AddField( 'nome', 'Johni Douglas' )
      .AddField( 'valor_prestacao', 1000.00 )
      .AddField( 'data_nascimento', StrToDateTime( '28/07/1986' ) )
      .GetSQL();


  Trace( SQL );
  FBConnection.ExecuteDirect( SQL );
end;

procedure TForm2.FBConnectionAfterConnect(Sender: TObject);
begin
  Trace( 'Conectado no BD' );
end;

procedure TForm2.FBConnectionAfterDisconnect(Sender: TObject);
begin
  Trace( 'Desconectado do BD' );
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FBConnection.Close();
end;

procedure TForm2.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
    Memo2.Lines:= SQLMonitor1.TraceList;
end;

end.

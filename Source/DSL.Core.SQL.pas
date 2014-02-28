unit DSL.Core.SQL;

interface

uses
  System.SysUtils, System.Rtti, DSL.Core.Utils;

type
  ISQL = interface
    ['{1E439DE3-2D77-463E-94CE-C159B88B016C}']
    function ToSQL(): string;
  end;

  TSQL = class( TInterfacedObject, ISQL )
  strict protected
    SQL: TStringBuilder;

    function ClauseIn( const AValues: array of TValue ): string;

  public
    function ToSQL(): string;


  public
    constructor Create();
    destructor Destroy; override;
  end;

implementation

uses
  System.StrUtils;

function TSQL.ClauseIn(const AValues: array of TValue): string;
var
  //Value: TValue;
  Aux: string;
  Index: Integer;
begin
  {TODO esta duplicada mover para outro lugar}

  Aux:= EmptyStr;

  { TODO Perguntar no stackoverflow
  for Value in AValues do
    Aux:= IfThen( Length(AValues) > 1, ', ' ) +  Aux + ValueToSQL( Value );
  }
  for Index := Low(AValues) to High(AValues) do
    Aux:=  Aux + IfThen( Index > 0, ', ' ) + ValueToSQL( AValues[Index] );

  SQL.Append( ' in (' + Aux + ')' );
end;

constructor TSQL.Create;
begin
  SQL:= TStringBuilder.Create();
  SQL.Clear();
end;

destructor TSQL.Destroy;
begin
  if ( Assigned( SQL ) ) then
    FreeAndNil( SQL);

  inherited;
end;

function TSQL.ToSQL: string;
begin
   Result:= SQL.ToString;
end;

end.

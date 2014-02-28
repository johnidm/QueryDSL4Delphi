unit DSL.Core.Builder;

interface

uses
  System.StrUtils,
  System.SysUtils,
  System.Rtti,
  DSL.Core.Utils, DSL.Core.SQL.DML.Delete;

type
  TDelete = class( TInterfacedObject, IDelete )
  strict private
    SQL: TStringBuilder;

  public
    function From(const ATable: string): TDelete;
    function Where(): TDelete;
    function Field( const AField: string ): TDelete;
    function Equal( const AField: TValue ): TDelete;
    function &And(): TDelete;
    function &In( const AValues: array of TValue ): TDelete;

    function ToSQL(): string;
  public
    constructor Create();
    destructor Destroy; override;
  end;

  TBuild<T : class, constructor> = class
    public function Instance(): T;
  end;

  TBuilder = class
    public function Delete: TDelete;
  end;


implementation

{ TBuilder }

function TBuilder.Delete: TDelete;
begin
  Result:= TDelete.Create();
end;

{ TBuild<T> }

function TBuild<T>.Instance: T;
begin
  Result:= T.Create();
end;

{ TDelete }


constructor TDelete.Create;
begin

  SQL:= TStringBuilder.Create();
  SQL.Clear();

  SQL.Append( 'delete from ' );


end;

destructor TDelete.Destroy;
begin
  if ( Assigned( SQL ) ) then
    FreeAndNil( SQL);

  inherited;
end;

function TDelete.&In(const AValues: array of TValue): TDelete;
var
  //Value: TValue;
  Aux: string;
  Index: Integer;
begin
  Aux:= EmptyStr;

  { TODO Perguntar no stackoverflow
  for Value in AValues do
    Aux:= IfThen( Length(AValues) > 1, ', ' ) +  Aux + ValueToSQL( Value );
  }
  for Index := Low(AValues) to High(AValues) do
    Aux:=  Aux + IfThen( Index > 0, ', ' ) + ValueToSQL( AValues[Index] );

  SQL.Append( ' in (' + Aux + ')' );
end;

function TDelete.&And(): TDelete;
begin
  SQL.Append( ' and ' );

  Result:= Self;
end;

function TDelete.Equal(const AField: TValue): TDelete;
begin
  SQL.Append(' = ' + ValueToSQL( AField ) );


  Result:= Self;
end;

function TDelete.Field(const AField: string): TDelete;
begin
  SQL.Append( AField );


  Result:= Self;
end;

function TDelete.From(const ATable: string): TDelete;
begin
  SQL.Append( ATable );


  Result:= Self;
end;

function TDelete.ToSQL: string;
begin
  Result:= SQL.ToString;

end;

function TDelete.Where: TDelete;
begin
  SQL.Append( ' where ' );


  Result:= Self;
end;

end.

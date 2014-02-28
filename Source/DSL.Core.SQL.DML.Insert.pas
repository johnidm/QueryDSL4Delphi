unit DSL.Core.SQL.DML.Insert;

interface

uses
  DSL.Core.SQL, System.Rtti, DSL.Core.Utils, System.Generics.Collections;

type
  TInsert = class(TSQL)
  strict private
    TempValue, TempField: string;

  public
    function Into( const ATable: string ): TInsert;
    function Field( const AField: string ): TInsert;
    function Value( const AValue: TValue ): TInsert;
  end;

implementation

uses
  System.SysUtils;

{ TInsert }


function TInsert.Into(const ATable: string): TInsert;
begin
  SQL.Append( 'insert into ' + ATable);

  Result:= Self;
end;

function TInsert.Field(const AField: string): TInsert;
begin
  TempField:= AField;

  Result:= Self;
end;

function TInsert.Value(const AValue: TValue): TInsert;
begin
  if ( TempValue = EmptyStr ) then
  begin
    TempValue:= ValueToSQL( AValue );
    SQL.Append( ' (' + TempField + ') values (' + TempValue + ')' );
  end else
  begin
  end;

  Result:= Self;
end;

end.

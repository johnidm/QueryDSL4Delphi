unit DSL.Core.SQL.DML.Update;

interface

uses DSL.Core.SQL, System.Rtti, DSL.Core.SQL.Utils;

type
  TUpdate = class( TSQL )
  public
    function Table( const ATable: string ): TUpdate;
    function &Set(): TUpdate;
    function Field( const AField: string ): TUpdate;
    function Value( const AValue: TValue ): TUpdate;
    function Where(): TUpdate;
    function Equal( const AValue: Tvalue ): TUpdate;
    function &In( const AValues: array of TValue ): TUpdate;
    function &And(): TUpdate;
    function Comma(): TUpdate;
  end;


implementation

{ TUpdate }

function TUpdate.&In(const AValues: array of TValue): TUpdate;
begin
  ClauseIn( AValues );

  Result:= Self;
end;

function TUpdate.&And: TUpdate;
begin
  SQL.Append( ' and ' );

  Result:= Self;
end;

function TUpdate.Comma: TUpdate;
begin
  SQL.Append( ', ' );
  Result:= Self;
end;

function TUpdate.Equal(const AValue: Tvalue): TUpdate;
begin
  SQL.Append( ' = ' + ValueToSQL( AValue ) );

  Result:= Self;
end;

function TUpdate.Field(const AField: string): TUpdate;
begin
  SQL.Append( AField );

  Result:= Self;
end;

function TUpdate.&Set: TUpdate;
begin
  SQL.Append( ' set ' );

  Result:= Self;
end;

function TUpdate.Table(const ATable: string): TUpdate;
begin
  SQL.Append( 'update ' );
  SQL.Append( ATable );

  Result:= Self;
end;

function TUpdate.Value(const AValue: TValue): TUpdate;
begin
  SQl.Append( ' = ' + ValueToSQL( AValue ) );

  Result:= Self;
end;

function TUpdate.Where: TUpdate;
begin
  SQL.Append( ' where ' );

  Result:= Self;
end;

end.

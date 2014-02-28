unit DSL.Core.SQL.DML.Delete;

interface

uses
  DSL.Core.SQL, System.SysUtils, System.Rtti, DSL.Core.Utils;

type
  TDelete = class( TSQL )
  public
    function From(const ATable: string): TDelete;
    function Where(): TDelete;
    function Field( const AField: string ): TDelete;
    function Equal( const AField: TValue ): TDelete;
    function &And(): TDelete;
    function &In( const AValues: array of TValue ): TDelete;
  end;

implementation

uses
  System.StrUtils;

{ TDelete }

function TDelete.&In(const AValues: array of TValue): TDelete;
begin
  ClauseIn( AValues );

  Result:= Self;
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
  SQL.Append( 'delete from ' ); { TODO mudar para outro lugar esse código }

  SQL.Append( ATable );


  Result:= Self;
end;

function TDelete.Where: TDelete;
begin
  SQL.Append( ' where ' );


  Result:= Self;
end;

end.

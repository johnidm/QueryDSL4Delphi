unit Base.BuilderSQL.Update;

interface

uses
  Base.BuilderSQL,
  Base.BuilderSQL.Utils;

type
  TUpdateSQL = class( TBuilderSQL )
    function GetSQL(): string;  override;
    class function Builder(): TBuilderSQL;
  end;

implementation

{ TUpdateSQL }

class function TUpdateSQL.Builder: TBuilderSQL;
begin
  Result:= TUpdateSQL.Create();
end;

function TUpdateSQL.GetSQL: string;
begin
  Result:=
    'update ' + Table + ' set ' +

    GetFields( Fields ) +

    GetWheres( Wheres );
end;

end.

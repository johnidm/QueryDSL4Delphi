unit Base.BuilderSQL.Update;

interface

uses
  Base.BuilderSQL,
  Base.BuilderSQL.Utils;

type
  TUpdateSQL = class( TBuilderSQL )
    function ToSQL(): string;  override;
    class function Builder(): TBuilderSQL;
  end;

implementation

{ TUpdateSQL }

class function TUpdateSQL.Builder: TBuilderSQL;
begin
  Result:= TUpdateSQL.Create();
end;

function TUpdateSQL.ToSQL: string;
begin
  Result:=
    'update ' + FTable + ' set ' +

    GetFields( Fields ) +

    GetWheres( Wheres );
end;

end.

unit Base.BuilderSQL.Delete;

interface

uses
  Base.BuilderSQL.Utils,
  Base.BuilderSQL;

type
  TDeleteSQL = class( TBuilderSQL )
    function ToSQL(): string; override;
    class function Builder(): TBuilderSQL;
  end;

implementation

{ TDeleteSQL }

class function TDeleteSQL.Builder: TBuilderSQL;
begin
  Result:= TDeleteSQL.Create();
end;



function TDeleteSQL.ToSQL
: string;
begin
  Result:=
    'delete from ' + FTable +

    GetWheres( Wheres )
end;

end.

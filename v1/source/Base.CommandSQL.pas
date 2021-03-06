unit Base.CommandSQL;

interface

uses
  Base.BuilderSQL,

  System.SysUtils;
type

  {$IFDEF INTERFACE}
  ICommandSQL = interface ['{9FA3224F-ED1B-48FE-8BF7-EB11084E51EE}']
    function SQL(): string;
  end;
  {$ENDIF}
  TCommandSQL = class {$IFDEF INTERFACE}( TInterfacedObject, ICommandSQL ) {$ENDIF}
  strict private
    BuilderSQL: TBuilderSQL;
  public
    destructor Destroy(); override;
    constructor Create( const ABuilderSQL: TBuilderSQL );
    function SQL(): string;
    class function Builder( const ABuilderSQL: TBuilderSQL ): {$IFDEF INTERFACE} ICommandSQL {$ELSE} TCommandSQL {$ENDIF};
  end;


implementation


class function TCommandSQL.Builder( const ABuilderSQL: TBuilderSQL ): {$IFDEF INTERFACE} ICommandSQL {$ELSE} TCommandSQL {$ENDIF};
begin
  Result:= TCommandSQL.Create( ABuilderSQL );
end;



constructor TCommandSQL.Create(const ABuilderSQL: TBuilderSQL);
begin
  BuilderSQL:= ABuilderSQL;
end;

destructor TCommandSQL.Destroy;
begin
  if ( Assigned( BuilderSQL ) ) then
    FreeAndNil( BuilderSQL );

  inherited;
end;



function TCommandSQL.SQL: string;
begin
  Result:= BuilderSQL.ToSQL();
end;



end.

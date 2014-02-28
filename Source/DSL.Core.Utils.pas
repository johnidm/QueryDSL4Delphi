unit DSL.Core.Utils;

interface

uses
  System.SysUtils,
  System.Rtti;

function ValueToSQL( const AValue: TValue ): string;

implementation

uses
  System.TypInfo;

function ValueToSQL( const AValue: TValue ): string;
begin
  { TODO mudar: criar uma classe helper }
  if (AValue.Kind in [tkChar, tkString, tkWChar, tkLString, tkWString, tkUString] ) then
    Result:= QuotedStr( AValue.ToString )
  else
    Result:= AValue.ToString;
end;

end.

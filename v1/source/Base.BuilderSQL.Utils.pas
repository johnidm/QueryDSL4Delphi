unit Base.BuilderSQL.Utils;

interface

uses
 Base.Utils,
 Base.Collections;

 function GetFields( const ACollectionsSQL: TCollectionsSQL ): string;
 function GetWheres( const ACollectionsSQL: TCollectionsSQL ): string;

 function GetListFieldsValues(const ACollectionsSQL: TCollectionsSQL ): string;
 function GetListFields( const ACollectionsSQL: TCollectionsSQL ): string;

implementation

uses
  System.SysUtils, System.StrUtils;

function GetFields( const ACollectionsSQL: TCollectionsSQL ): string;
var
  Indice: Integer;
begin
  Result:= EmptyStr;

  // campo1 = valor1, campo1 = 'valor2', campo3 = valor3
  for Indice := Low( ACollectionsSQL.Collection ) to High( ACollectionsSQL.Collection ) do
    Result:= Result + IfThen( Indice > 0, ', ' ) + ACollectionsSQL.Collection[Indice].Field +
      ' = ' + VariantToString ( ACollectionsSQL.Collection[Indice].Value );
end;

function GetWheres( const ACollectionsSQL: TCollectionsSQL ): string;

  function GetWhere(): string;
  var
    Indice: Integer;
  begin

    // campo1 = valor1 and campo2 = valor2 or campo3 = valor3
    for Indice := Low( ACollectionsSQL.Collection ) to High( ACollectionsSQL.Collection ) do
      Result:= Result + IfThen( Indice > 0, ACollectionsSQL.LogicalAsText( ACollectionsSQL.Collection[Indice].OperatorLogical ) ) + ACollectionsSQL.Collection[Indice].Field +
        ACollectionsSQL.ComparisonAsText( ACollectionsSQL.Collection[Indice].OperatorComparison ) + VariantToString ( ACollectionsSQL.Collection[Indice].Value );
  end;

begin
  Result:= EmptyStr;

  if ( not ( ACollectionsSQL.IsEmpty ) ) then
  begin
    Result:= ' where ' + GetWhere()
  end;

end;

function GetListFields( const ACollectionsSQL: TCollectionsSQL ): string;
var
  Indice: Integer;
begin
  Result:= EmptyStr;

  // campo1, campo2, campo3
  for Indice := Low( ACollectionsSQL.Collection ) to High(  ACollectionsSQL.Collection ) do
    Result:= Result + IfThen( Indice > 0, ', ' ) + ACollectionsSQL.Collection[Indice].Field  ;

end;


function GetListFieldsValues(const ACollectionsSQL: TCollectionsSQL ): string;
var
  Indice: Integer;
begin
  Result:= EmptyStr;

  // valor1, valor2, valor3
  for Indice := Low( ACollectionsSQL.Collection ) to High(  ACollectionsSQL.Collection ) do
    Result:= Result + IfThen( Indice > 0, ', ' ) + VariantToString ( ACollectionsSQL.Collection[Indice].Value );
end;


end.

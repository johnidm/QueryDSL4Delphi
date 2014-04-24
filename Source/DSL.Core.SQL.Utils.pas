unit DSL.Core.SQL.Utils;

interface

uses
  System.Variants,
  System.Rtti;

function ValueToSQL(const AValue: TValue): string;

implementation

uses
  System.DateUtils,
  System.TypInfo,
  System.SysUtils;

function DateTimeToSQL(const AValue: TValue): string;

  function HasDateValidIn(const ADateTime: TDateTime): Boolean;
  var
    Day, Mounth, Year: Word;

  begin
    Day := DayOf(ADateTime);
    Mounth := MonthOf(ADateTime);
    Year := YearOf(ADateTime);

    Result := (Day in [1 .. 31]) and (Mounth in [1 .. 12]) and (Year > 0) and
      (EncodeDate(Year, Mounth, Day) > 0)
  end;

  function HasTimeValidIn(const ADateTime: TDateTime): Boolean;
  var
    Hour, Minute, Second: Word;

  begin
    Hour := HourOf(ADateTime);
    Minute := MinuteOf(ADateTime);
    Second := SecondOf(ADateTime);

    Result := (Hour in [0 .. 23]) and (Minute in [0 .. 59]) and
      (Second in [0 .. 59]) and

      ((Hour <> 0) or (Minute <> 0) or (Second <> 0))
  end;

var
  DateTime: TDateTime;

begin
  DateTime := AValue.AsExtended;
  {
    if ( HasTimeValidIn( DateTime ) and ( HasDateValidIn ( DateTime ) ) ) then
    Result:= FormatDateTime( 'dd.mm.yyyy hh:nn:ss', DateTime )
    else if ( HasTimeValidIn( DateTime ) ) then
    Result:= FormatDateTime( 'hh:nn:ss', DateTime )
    else if ( HasDateValidIn( DateTime ) ) then
    Result:= FormatDateTime( 'dd.mm.yyyy', DateTime )
  }

  if (DateTime = DateOf(DateTime)) then
    Result := FormatDateTime('dd.mm.yyyy', DateTime)
  else if (DateTime = TimeOf(DateTime)) then
    Result := FormatDateTime('hh:nn:ss', DateTime)
  else
    Result := FormatDateTime('dd.mm.yyyy hh:nn:ss', DateTime);

  Result := QuotedStr(Result);
end;

function FloatDateTimeToSQL(const AValue: TValue): string;
var
  FmtSet: TFormatSettings;
begin
  FmtSet.DecimalSeparator := '.';
  Result := QuotedStr(FloatToStrF(AValue.AsExtended, ffGeneral, 8, 4, FmtSet))
end;

function ValueToSQL(const AValue: TValue): string;
begin

  if (AValue.ToString = EmptyStr) then
    Exit('null');

  case (AValue.Kind) of

    tkChar, tkString, tkWChar, tkLString, tkWString, tkUString:
      Result := QuotedStr(AValue.ToString);

    tkFloat:
      begin

          if ( VarIsFloat( AValue.AsVariant ) ) then
          Result:= FloatDateTimeToSQL( AValue )
          else
          if VarIsType( AValue.AsVariant, varDate ) then
          Result:= DateTimeToSQL( AValue )

      end

  else
    Result := AValue.ToString;
  end;

end;

end.

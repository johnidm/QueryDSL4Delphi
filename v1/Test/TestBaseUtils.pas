unit TestBaseUtils;

interface

uses
  TestFramework, System.SysUtils, Base.Utils ;

type
  TestTBuilderInsert = class(TTestCase)
  published
    procedure TestIsNotValidTime();
    procedure TestIsNotValidTime2();
    procedure TestIsNotValidTime3();

    procedure TestIsValidTime();
    procedure TestIsValidTime2();
    procedure TestIsValidTime3();
    procedure TestIsValidTime4();
    procedure TestIsValidTime5();

    procedure TestIsNotValidDate();
    procedure TestIsNotValidDate2();

  end;

implementation

{ TestTBuilderInsert }

procedure TestTBuilderInsert.TestIsNotValidDate;
begin
  CheckFalse( HasDateValidIn( StrToDateDef( '00/00/0000', 0 ) ) );
end;

procedure TestTBuilderInsert.TestIsNotValidDate2;
begin
  CheckFalse( HasDateValidIn( StrToTime( '08:05:05' ) ) );
end;

procedure TestTBuilderInsert.TestIsNotValidTime;
begin
  CheckFalse( HasTimeValidIn(  StrToDate( '01/01/2011' )  ) )
end;

procedure TestTBuilderInsert.TestIsNotValidTime2;
begin
  CheckFalse( HasTimeValidIn(  StrToDateTime( '01/01/2011' )  ) )
end;

procedure TestTBuilderInsert.TestIsNotValidTime3;
begin
  CheckFalse( HasTimeValidIn(  StrToTime( '00:00:00' )  ) )
end;

procedure TestTBuilderInsert.TestIsValidTime;
begin
  CheckTrue( HasTimeValidIn ( StrToDateTime( '01/01/2012 01:01:01' ) ) );
end;

procedure TestTBuilderInsert.TestIsValidTime2;
begin
  CheckTrue( HasTimeValidIn ( StrToTime( '00:00:01' ) ) );
end;

procedure TestTBuilderInsert.TestIsValidTime3;
begin
  CheckTrue( HasTimeValidIn ( StrToTime( '00:01:00' ) ) );
end;

procedure TestTBuilderInsert.TestIsValidTime4;
begin
  CheckTrue( HasTimeValidIn ( StrToTime( '01:00:00' ) ) );
end;

procedure TestTBuilderInsert.TestIsValidTime5;
begin
  CheckTrue( HasTimeValidIn ( StrToDateTime( '09/09/2012 00:00:01' ) ) );
end;

initialization
  RegisterTest(TestTBuilderInsert.Suite);

end.

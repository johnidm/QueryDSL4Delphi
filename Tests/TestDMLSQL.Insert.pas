unit TestDMLSQL.Insert;

interface

uses
  DUnitX.TestFramework, DSL.Core.SQL.Builder, DSL.Core.SQL.DML.Insert;

type

  [TestFixture]
  TTestDMLInsert = class(TObject)
  public

    [Test]
    procedure Should_Insert_Basic();
    [Test]
    procedure Should_Insert_Basic_Ceneric();
    [Test]
    procedure Should_Insert_Two_Fields();
    [Test]
    procedure Should_Insert_Tree_Fields();

    [Test]
    procedure Should_Insert_DateTime();
    [Test]
    procedure Should_Insert_Date();
    [Test]
    procedure Should_Insert_Time();

    [Test]
    procedure Should_Insert_Currency();

  end;

implementation

uses
  System.SysUtils;

procedure TTestDMLInsert.Should_Insert_Basic;
var
  Ret, SQL: string;

begin
  SQL := 'insert into CUSTOMERS (ID) values (1)';
  Ret := TBuild<TInsert>.Instance.Into('CUSTOMERS').Field('ID').Value(1).ToSQL;

  Assert.AreEqual(SQL, Ret);
end;

procedure TTestDMLInsert.Should_Insert_Basic_Ceneric;
var
  Ret, SQL: string;
begin
  SQL := 'insert into PAYMENT (ID) values (1)';
  Ret := TBuilder.Insert.Into('PAYMENT').Field('ID').Value(1).ToSQL;

  Assert.AreEqual(SQL, Ret);
end;

procedure TTestDMLInsert.Should_Insert_Currency;
var
  I_SQL, SQL: string;

  Valor: Currency;
begin
  SQL:= 'insert into ORDER (ID, VL_ORDER) values (1, 50.00)';

  Valor:= 50;

  I_SQL:= TBuild<TInsert>.Instance.Into('ORDER').Field('ID').Value(1)
              .Field('VL_ORDER').Value(Valor).ToSQL;

  Assert.AreEqual( SQL, I_SQL );

end;

procedure TTestDMLInsert.Should_Insert_Date;
var
  I_SQL, SQL: string;
  Date: TDate;
begin
  SQL:= 'insert into ORDER (ID, DT_ORDER) values (1, ''01.01.2015'')';

  Date:= StrToDate( '01/01/2015' );

  I_SQL:= TBuild<TInsert>.Instance.Into('ORDER').Field('ID').Value(1)
              .Field('DT_ORDER').Value(Date).ToSQL;

  Assert.AreEqual( SQL, I_SQL );
end;

procedure TTestDMLInsert.Should_Insert_DateTime;
var
  I_SQL, SQL: string;

  DateTime: TDateTime;
begin
  SQL:= 'insert into ORDER (ID, DT_ORDER) values (89, ''01.01.2015 02:10:59'')';

  DateTime:= StrToDateTime( '01/01/2015 02:10:59' );
  I_SQL:= TBuild<TInsert>.Instance.Into('ORDER').Field('ID').Value(89)
              .Field('DT_ORDER').Value( DateTime ).ToSQL;
  Assert.AreEqual( SQL, I_SQL );


end;

procedure TTestDMLInsert.Should_Insert_Time;
var
  I_SQL, SQL: string;

  Time: TTime;
begin
  SQL:=
   'insert into ORDER (ID, DT_ORDER) values (89, ''02:10:59'')';

  Time:= StrToTime( '02:10:59'  );
  I_SQL:= TBuild<TInsert>.Instance.Into('ORDER').Field('ID').Value(89)
              .Field('DT_ORDER').Value(Time).ToSQL;



  Assert.AreEqual( SQL, I_SQL );
end;

procedure TTestDMLInsert.Should_Insert_Tree_Fields;
var
  Ret, SQL: string;
  Insert: TBuild<TInsert>;
begin
  SQL := 'insert into ORDER (ID, NUMBER, FLAG) values (1, 59847, ''C'')';
  Ret := TBuild<TInsert>.Instance.Into('ORDER').Field('ID').Value(1)
    .Field('NUMBER').Value(59847).Field('FLAG').Value('C').ToSQL;

  Assert.AreEqual(SQL, Ret);
end;

procedure TTestDMLInsert.Should_Insert_Two_Fields;
var
  Ret, SQL: string;

begin
  SQL := 'insert into CUSTOMERS (ID, NAME) values (1, ''Fulano de Tal'')';

  Ret := TBuild<TInsert>.Instance.Into('CUSTOMERS').Field('ID').Value(1)
    .Field('NAME').Value('Fulano de Tal').ToSQL;

  Assert.AreEqual(SQL, Ret);
end;

initialization

TDUnitX.RegisterTestFixture(TTestDMLInsert);

end.

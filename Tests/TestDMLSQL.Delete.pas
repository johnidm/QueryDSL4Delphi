{reference Delete SQL

http://en.wikipedia.org/wiki/Delete_(SQL)
incluir alias nos ogjetos SQL
 http://www.techonthenet.com/sql/delete.php

Teste com campos de data

}

unit TestDMLSQL.Delete;

interface
uses
  DUnitX.TestFramework, DSL.Core.Builder;

type
  [TestFixture]
  TTestDMLDelete = class(TObject)
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure ShouldDeleteBasicWithOutClauseWhere();
    [Test]
    procedure ShouldDeleteBasicWithOutClauseWhereCeneric();
    [Test]
    procedure ShouldDeleteBaseWithClauseWhereEqualOneField();
    [Test]
    procedure ShouldDeleteBaseWithClauseWhereEqualTwoFieldAndEqual();
    [Test]
    procedure ShouldDeleteBaseWithClauseWhereEqualMoreFieldEqual();

  end;

implementation

uses
  DSL.Core.SQL.DML.Delete;

procedure TTestDMLDelete.Setup;
begin
end;

procedure TTestDMLDelete.shouldDeleteBaseWithClauseWhereEqualMoreFieldEqual;
begin
end;

procedure TTestDMLDelete.shouldDeleteBaseWithClauseWhereEqualOneField;
var
  SQL, B_SQL: string;

begin
  SQL:= 'delete from SALlERS where ID = 9';
  B_SQL:= TBuild<TDelete>.Instance.From('SALlERS').Where().Field('ID').Equal(9).ToSQL;
  Assert.AreEqual( SQL, B_SQL );

  {
  SQL:= 'delete from SALlERS where ID <> 9';
  Assert.AreEqual( SQL, B_SQL );
  SQL:= 'delete from SALlERS where ID > 9';
  Assert.AreEqual( SQL, B_SQL );
  SQL:= 'delete from SALlERS where ID >= 9';
  Assert.AreEqual( SQL, B_SQL );
  SQL:= 'delete from SALlERS where ID < 9';
  Assert.AreEqual( SQL, B_SQL );
  SQL:= 'delete from SALlERS where ID <= 9';
  Assert.AreEqual( SQL, B_SQL );
  }

  SQL:= 'delete from SALlERS where ID in (9, 10, 15, 20)';
  B_SQL:= TBuild<TDelete>.Instance.From('SALlERS').Where().Field('ID').&In([9, 10, 15, 20]).ToSQL;
  Assert.AreEqual( SQL, B_SQL );
end;

procedure TTestDMLDelete.shouldDeleteBaseWithClauseWhereEqualTwoFieldAndEqual;
var
  B_SQL, SQL: string;

begin
  SQL:= 'delete from SALLERS where ID = 1 and NAME = ''JOHN''';

  B_SQL:= TBuild<TDelete>.Instance.From('SALLERS').Where().Field('ID').Equal(1).&And.Field('NAME').Equal('JOHN').ToSQL;

  Assert.AreEqual( SQL, B_SQL );
end;

procedure TTestDMLDelete.shouldDeleteBasicWithOutClauseWhere;
var
  SQLBuilder, SQL: string;

begin
  SQL:= 'delete from CUSTOMERS';

  SQLBuilder:=
    TBuild<TDelete>.Instance.From('CUSTOMERS').ToSQL;

  Assert.AreEqual( SQL, SQLBuilder );
end;

procedure TTestDMLDelete.shouldDeleteBasicWithOutClauseWhereCeneric;
var
  SQLBuilder, SQL: string;

begin
  SQL:= 'delete from PRODUCTS';

  SQLBuilder:=
    TBuilder.Delete.From('PRODUCTS').ToSQL;

  Assert.AreEqual( SQL, SQLBuilder );
end;

procedure TTestDMLDelete.TearDown;
begin
end;


initialization
  TDUnitX.RegisterTestFixture(TTestDMLDelete);
end.

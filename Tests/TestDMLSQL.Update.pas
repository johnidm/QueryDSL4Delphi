unit TestDMLSQL.Update;

interface
uses
  DUnitX.TestFramework, DSL.Core.SQL.DML.Update, DSL.Core.Builder;

type

  [TestFixture]
  TTestDMLUpdate = class(TObject)
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    //[Test]
    procedure ShouldUpdateBasicWithOutClauseWhere();
    //[Test]
    procedure ShouldUpdateBasicWithOutClauseWhereCeneric();
    //[Test]
    procedure ShouldUpdateBasicWithClauseWhereOneField();

    //[Test]
    procedure ShouldUpdateBaseWithClauseWhereEqualTwoFieldAndEqual();
  end;

implementation

procedure TTestDMLUpdate.Setup;
begin
end;

procedure TTestDMLUpdate.TearDown;
begin
end;

procedure TTestDMLUpdate.ShouldUpdateBaseWithClauseWhereEqualTwoFieldAndEqual;
var
  U_SQL, SQL: string;

  Update: TBuild<TUpdate>;
begin
  SQL:=
    'update PRODUCTS set DESCRIPTION = ''Smartfone Nokia'', COST = 0 where ID = 9 and COST = 50';

  U_SQL:= Update.Instance.Table( 'PRODUCTS' ).&Set.
                 Field('DESCRIPTION').Value('Smartfone Nokia').Comma().
                 Field('COST').Value(0).
                 Where().Field('ID').Equal(9).&And.
                         Field('COST').Equal(50).ToSQL;


  Assert.AreEqual( SQL, U_SQL );
end;

procedure TTestDMLUpdate.ShouldUpdateBasicWithClauseWhereOneField;
var
  __SQL, U_SQL: string;

  Update: TBuild<TUpdate>;
begin
  __SQL:= 'update CUSTOMERS set NAME = ''Ciclano de Tal'' where ID = 1';
  U_SQL:= Update.Instance.
          Table( 'CUSTOMERS' ).&Set().
          Field('NAME').Value('Ciclano de Tal').
          Where().Field('ID').Equal(1).ToSQL;
  Assert.AreEqual( __SQL, U_SQL );

  __SQL:= 'update CUSTOMERS set NAME = ''Ciclano de Tal'' where ID in (1, 2, 5, 8, 100)';
  U_SQL:= Update.Instance.
          Table( 'CUSTOMERS' ).&Set().
          Field('NAME').Value('Ciclano de Tal').
          Where().Field('ID').&In([1, 2, 5, 8, 100]).ToSQL;
  Assert.AreEqual( __SQL, U_SQL );
end;

procedure TTestDMLUpdate.ShouldUpdateBasicWithOutClauseWhere;
var
  U_SQL, SQL: string;

  Update: TBuild<TUpdate>;
begin
  SQL:= 'update CUSTOMERS set NAME = ''Fulano De Tal''';

  U_SQL:= Update.Instance.Table('CUSTOMERS').&Set().Field('NAME').Value( 'Fulano De Tal' ).ToSQL();

  Assert.AreEqual( SQL, U_SQL );
end;



procedure TTestDMLUpdate.ShouldUpdateBasicWithOutClauseWhereCeneric;
var
  U_SQL, SQL: string;

  Builder: TBuilder;
begin
  SQL:= 'update PRODUCTS set COST = 0';

  U_SQL:= Builder.Update.Table('PRODUCTS').&Set().Field('COST').Value( 0 ).ToSQL;

  Assert.AreEqual( SQL, U_SQL );
end;

initialization
  TDUnitX.RegisterTestFixture(TTestDMLUpdate);
end.

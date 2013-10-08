unit TestBuilderDelete;

interface

uses
  TestFramework;

type
  TestTBuilderDelete = class ( TTestCase )

  published

    procedure TestSQL();
    procedure TestSQLWithWhere();
    procedure TestSQLWithTwoWhere();
  end;



implementation

{ TestTBuilderDelete }

uses Base.BuilderSQL.Delete, Base.Utils;

procedure TestTBuilderDelete.TestSQL;
begin
  CheckEqualsString(
    'delete from clientes',



    TDeleteSQL.Builder().Table( 'clientes' ).GetSQL()




  );
end;

procedure TestTBuilderDelete.TestSQLWithTwoWhere;
begin
  CheckEqualsString(
   'delete from dados where id = 1 and nome = ''Johni''',

   TDeleteSQL.Builder().Table( 'dados'
   ).AddWhere( 'id', 1, topcompEqual ).AddWhereAnd( 'nome', 'Johni', topcompEqual ).GetSQL()
  );


end;

procedure TestTBuilderDelete.TestSQLWithWhere;
begin
  CheckEqualsString(
    'delete from clientes where id = 1',

    TDeleteSQL.Builder().Table( 'clientes' ).AddWhere( 'id', 1, topcompEqual ).GetSQL()

  );


end;

initialization
  RegisterTest(TestTBuilderDelete.Suite);

end.

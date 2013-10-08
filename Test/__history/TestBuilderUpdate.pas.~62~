unit TestBuilderUpdate;

interface

uses
  TestFramework;

type
  TestTBuilderUpdate = class(TTestCase)
  published
    procedure TestSQL();
    procedure TestSQLWithTwoFields();

    procedure TestSQLWithWhere();

    procedure TestSQLWithTwoWhereAnd();
    procedure TestSQLWithTwoWhereOr();
  end;

implementation

{ TestTBuilderUpdate }

uses Base.BuilderSQL.Update, System.SysUtils, Base.Utils;

procedure TestTBuilderUpdate.TestSQL;
begin
  CheckEqualsString(
    'update clientes set nome = ''Johni Douglas Marangon''',

    TUpdateSQL.Builder().AddTable( 'clientes' ).AddField( 'nome', 'Johni Douglas Marangon' ).GetSQL()


  );
end;

procedure TestTBuilderUpdate.TestSQLWithTwoFields;
begin
  CheckEqualsString(
    'update dados set campo01 = ''Texto do campo'', campo02 = 234',

    TUpdateSQL.Builder().AddTable( 'dados' ).AddField( 'campo01', 'Texto do campo' )
      .AddField( 'campo02', 234 ).GetSQL()
  );


end;

procedure TestTBuilderUpdate.TestSQLWithTwoWhereAnd;
begin
  CheckEqualsString(
    'update dados set nome = ''Johni'', data_nascimento = ''01.01.2012'' where id = 1 and nome = ''JOhni''',

    TUpdateSQL.Builder()
      .AddTable( 'dados' )
      .AddField( 'nome', 'Johni' )
      .AddField( 'data_nascimento', StrToDateTime( '01/01/2012' ) )
      .AddWhere( 'id', 1, topcompEqual )
      .AddWhereAnd( 'nome', 'JOhni', topcompEqual ).GetSQL()

  );


end;

procedure TestTBuilderUpdate.TestSQLWithTwoWhereOr;
begin
  CheckEqualsString(
    'update dados set nome = ''Johni'' where id = 1 or nome = ''JOhni''',

    TUpdateSQL.Builder().AddTable( 'dados' ).AddField( 'nome', 'Johni' )
      .AddWhere( 'id', 1, topcompEqual )
      .AddWhereOr( 'nome', 'JOhni', topcompEqual ).GetSQL()

  );
end;



procedure TestTBuilderUpdate.TestSQLWithWhere;
begin
  CheckEqualsString(
    'update dados set id = 1 where id = 1',

    TUpdateSQL.Builder().AddTable( 'dados' ).AddField( 'id', 1 ).AddWhere( 'id', 1, topcompEqual).GetSQL()

  );
end;

initialization
   RegisterTest(TestTBuilderUpdate.Suite);

end.

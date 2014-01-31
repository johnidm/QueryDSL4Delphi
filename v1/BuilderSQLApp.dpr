program BuilderSQLApp;

uses
  Vcl.Forms,
  App in 'App.pas' {Form2},
  Base.BuilderSQL.Delete in 'source\Base.BuilderSQL.Delete.pas',
  Base.BuilderSQL.Insert in 'source\Base.BuilderSQL.Insert.pas',
  Base.BuilderSQL in 'source\Base.BuilderSQL.pas',
  Base.BuilderSQL.Update in 'source\Base.BuilderSQL.Update.pas',
  Base.BuilderSQL.Utils in 'source\Base.BuilderSQL.Utils.pas',
  Base.Collections in 'source\Base.Collections.pas',
  Base.CommandSQL in 'source\Base.CommandSQL.pas',
  Base.Utils in 'source\Base.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

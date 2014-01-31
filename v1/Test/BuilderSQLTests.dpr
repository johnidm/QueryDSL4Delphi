program BuilderSQLTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,

  TestBuilderInsert in 'TestBuilderInsert.pas',
  TestBaseUtils in 'TestBaseUtils.pas',
  TestBuilderUpdate in 'TestBuilderUpdate.pas',
  TestBuilderDelete in 'TestBuilderDelete.pas',

  Base.BuilderSQL.Update in '..\source\Base.BuilderSQL.Update.pas',
  Base.BuilderSQL.Insert in '..\source\Base.BuilderSQL.Insert.pas',
  Base.BuilderSQL.Delete in '..\source\Base.BuilderSQL.Delete.pas',
  Base.BuilderSQL.Utils in '..\source\Base.BuilderSQL.Utils.pas',
  Base.Collections in '..\source\Base.Collections.pas',
  Base.BuilderSQL in '..\source\Base.BuilderSQL.pas',
  Base.CommandSQL in '..\source\Base.CommandSQL.pas',
  Base.Utils in '..\source\Base.Utils.pas';

{$R *.RES}


begin
  ReportMemoryLeaksOnShutdown:= True;
  DUnitTestRunner.RunRegisteredTests;
end.


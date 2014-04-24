program TestBuilder4SQL;

{$APPTYPE CONSOLE}
uses
  SysUtils,
  DUnitX.AutoDetect.Console,
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestRunner,
  DUnitX.TestFramework,
  TestDMLSQL.Delete in 'TestDMLSQL.Delete.pas',
  DSL.Core.SQL.Builder in '..\Source\DSL.Core.SQL.Builder.pas',
  DSL.Core.SQL.Utils in '..\Source\DSL.Core.SQL.Utils.pas',
  DSL.Core.SQL in '..\Source\DSL.Core.SQL.pas',
  DSL.Core.SQL.DML.Delete in '..\Source\DSL.Core.SQL.DML.Delete.pas',
  DSL.Core.SQL.DML.Update in '..\Source\DSL.Core.SQL.DML.Update.pas',
  TestDMLSQL.Update in 'TestDMLSQL.Update.pas',
  TestDMLSQL.Insert in 'TestDMLSQL.Insert.pas',
  DSL.Core.SQL.DML.Insert in '..\Source\DSL.Core.SQL.DML.Insert.pas';

var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
  ReportMemoryLeaksOnShutdown:= True;

  try
    //Create the runner
    runner := TDUnitX.CreateRunner;
    runner.UseRTTI := True;
    //tell the runner how we will log things
    logger := TDUnitXConsoleLogger.Create(true);
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create;
    runner.AddLogger(logger);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;

    {$IFNDEF CI}
      //We don't want this happening when running under CI.
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
end.

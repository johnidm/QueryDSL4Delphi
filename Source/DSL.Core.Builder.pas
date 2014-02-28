unit DSL.Core.Builder;

interface

uses
  System.SysUtils,
  System.Rtti,
  DSL.Core.SQL.DML.Delete,
  DSL.Core.Utils,
  DSL.Core.SQL.DML.Update;

type

  TBuild<T : class, constructor> = class
    public function Instance(): T;
  end;

  TBuilder = class
    public function Delete: TDelete;
    public function Update: TUpdate;
  end;


implementation

{ TBuilder }

function TBuilder.Delete: TDelete;
begin
  Result:= TDelete.Create();
end;

function TBuilder.Update: TUpdate;
begin
   Result:= TUpdate.Create();
end;

{ TBuild<T> }

function TBuild<T>.Instance: T;
begin
  Result:= T.Create();
end;



end.

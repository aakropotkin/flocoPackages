{

  inputs.packument.url   = "https://registry.npmjs.org/estraverse?rev=92-56eb799e2ca28bda6eae1d4802ee19db";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "estraverse";
    ldir  = "info/unscoped/e/estraverse";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

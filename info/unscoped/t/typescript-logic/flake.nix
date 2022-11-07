{

  inputs.packument.url   = "https://registry.npmjs.org/typescript-logic?rev=1-32cf322224e02a3021a7ff70279fa627";
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
    ident = "typescript-logic";
    ldir  = "info/unscoped/t/typescript-logic";
    inherit packument fetchInfo;
  } // latest';

}

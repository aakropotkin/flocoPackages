{

  inputs.packument.url   = "https://registry.npmjs.org/symbol-observable?rev=28-7e5673f20efabd11be5b9b5249bb14a2";
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
    ident = "symbol-observable";
    ldir  = "info/unscoped/s/symbol-observable";
    inherit packument fetchInfo;
  } // latest';

}

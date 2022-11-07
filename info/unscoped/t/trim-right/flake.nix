{

  inputs.packument.url   = "https://registry.npmjs.org/trim-right?rev=8-1c02c94406195ae518e32e5915224c63";
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
    ident = "trim-right";
    ldir  = "info/unscoped/t/trim-right";
    inherit packument fetchInfo;
  } // latest';

}

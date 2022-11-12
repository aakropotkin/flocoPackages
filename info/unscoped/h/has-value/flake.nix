{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/has-value?_rev=19-cb44718b60ddd0e7476175c5323155bc";
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
    ident = "has-value";
    ldir  = "info/unscoped/h/has-value";
    inherit packument fetchInfo;
  } // latest';

}

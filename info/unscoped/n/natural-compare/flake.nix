{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/natural-compare?_rev=5-8c516a69af0c31f66e2f5779d606a044";
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
    ident = "natural-compare";
    ldir  = "info/unscoped/n/natural-compare";
    inherit packument fetchInfo;
  } // latest';

}

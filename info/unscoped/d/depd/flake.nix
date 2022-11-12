{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/depd?_rev=58-8221bb04850ae16cde9adbe7d43aa715";
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
    ident = "depd";
    ldir  = "info/unscoped/d/depd";
    inherit packument fetchInfo;
  } // latest';

}

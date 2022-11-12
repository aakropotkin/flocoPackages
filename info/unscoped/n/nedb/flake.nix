{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nedb?_rev=304-25f8d2fa0cc9628364195e1015339203";
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
    ident = "nedb";
    ldir  = "info/unscoped/n/nedb";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/micromark-util-character?_rev=6-d9b76f53f8336b2440497ada1efd8342";
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
    ident = "micromark-util-character";
    ldir  = "info/unscoped/m/micromark-util-character";
    inherit packument fetchInfo;
  } // latest';

}

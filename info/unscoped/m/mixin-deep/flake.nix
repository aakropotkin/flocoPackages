{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mixin-deep?_rev=22-82bf1c6fb7f7baca8a1f313c4046905d";
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
    ident = "mixin-deep";
    ldir  = "info/unscoped/m/mixin-deep";
    inherit packument fetchInfo;
  } // latest';

}

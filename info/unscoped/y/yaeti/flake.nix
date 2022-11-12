{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/yaeti?_rev=13-6be2c1295102a3242144d6106bc2bdde";
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
    ident = "yaeti";
    ldir  = "info/unscoped/y/yaeti";
    inherit packument fetchInfo;
  } // latest';

}

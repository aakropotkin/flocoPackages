{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/deep-extend?_rev=60-7764eb6675cfc94430495df9f9f36a7b";
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
    ident = "deep-extend";
    ldir  = "info/unscoped/d/deep-extend";
    inherit packument fetchInfo;
  } // latest';

}

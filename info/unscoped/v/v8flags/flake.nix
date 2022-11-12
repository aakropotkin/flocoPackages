{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/v8flags?_rev=73-15ec5438385e055942650f86b1bf3f2c";
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
    ident = "v8flags";
    ldir  = "info/unscoped/v/v8flags";
    inherit packument fetchInfo;
  } // latest';

}

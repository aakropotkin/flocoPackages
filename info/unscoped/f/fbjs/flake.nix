{

  inputs.packument.url   = "https://registry.npmjs.org/fbjs?rev=118-fec3cd0cc5076b00af8f9e6ee8a967b9";
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
    ident = "fbjs";
    ldir  = "info/unscoped/f/fbjs";
    inherit packument fetchInfo;
  } // latest';

}

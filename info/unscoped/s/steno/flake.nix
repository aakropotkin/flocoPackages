{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/steno?_rev=32-da072eab93de33e3f9f4899281251679";
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
    ident = "steno";
    ldir  = "info/unscoped/s/steno";
    inherit packument fetchInfo;
  } // latest';

}

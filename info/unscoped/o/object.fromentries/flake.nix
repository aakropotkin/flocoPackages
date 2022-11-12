{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/object.fromentries?_rev=14-79a043a342ae15b8793443e26e3060fd";
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
    ident = "object.fromentries";
    ldir  = "info/unscoped/o/object.fromentries";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/rw?rev=34-382bf690faf7a68819f452ad35856ca0";
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
    ident = "rw";
    ldir  = "info/unscoped/r/rw";
    inherit packument fetchInfo;
  } // latest';

}

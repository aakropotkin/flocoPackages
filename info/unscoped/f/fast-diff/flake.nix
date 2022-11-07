{

  inputs.packument.url   = "https://registry.npmjs.org/fast-diff?rev=18-73c931c75abfcd52ea9ffc2b160fd17a";
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
    ident = "fast-diff";
    ldir  = "info/unscoped/f/fast-diff";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/rc-notification?rev=73-729f2a73f80eddb872bbb18831555464";
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
    ident = "rc-notification";
    ldir  = "info/unscoped/r/rc-notification";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

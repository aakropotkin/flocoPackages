{

  inputs.packument.url   = "https://registry.npmjs.org/set-cookie-parser?rev=29-eddb3f3f20d609a3d10c0647e3ff17b2";
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
    ident = "set-cookie-parser";
    ldir  = "info/unscoped/s/set-cookie-parser";
    inherit packument fetchInfo;
  } // latest';

}

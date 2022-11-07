{

  inputs.packument.url   = "https://registry.npmjs.org/vary?rev=32-1204003f26fcc089021d2b81fba5c3d9";
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
    ident = "vary";
    ldir  = "info/unscoped/v/vary";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

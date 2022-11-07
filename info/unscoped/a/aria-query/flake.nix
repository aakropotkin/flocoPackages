{

  inputs.packument.url   = "https://registry.npmjs.org/aria-query?rev=31-a00df2b8b575ca6796c7bffb0f69824d";
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
    ident = "aria-query";
    ldir  = "info/unscoped/a/aria-query";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

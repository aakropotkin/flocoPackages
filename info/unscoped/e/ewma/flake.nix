{

  inputs.packument.url   = "https://registry.npmjs.org/ewma?rev=4-9b80d0063cb9875518fdb6841ca2373b";
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
    ident = "ewma";
    ldir  = "info/unscoped/e/ewma";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/url-set-query?rev=3-de2ff1c29e80f4fd6e4f91e0daf0e303";
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
    ident = "url-set-query";
    ldir  = "info/unscoped/u/url-set-query";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/d3-fetch?rev=17-6c13b29711e6c9f3bd9a15087f2ddf3b";
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
    ident = "d3-fetch";
    ldir  = "info/unscoped/d/d3-fetch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/d3-path?rev=28-88f525347fbdb32ea90969cbaca522bb";
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
    ident = "d3-path";
    ldir  = "info/unscoped/d/d3-path";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/canvas?rev=404-5f4e6d22cfc4e4bcfc6a7a5470bdfbb9";
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
    ident = "canvas";
    ldir  = "info/unscoped/c/canvas";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

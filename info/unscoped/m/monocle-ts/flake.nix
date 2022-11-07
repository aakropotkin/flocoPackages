{

  inputs.packument.url   = "https://registry.npmjs.org/monocle-ts?rev=64-9f83257709d7b54c3aa4209c9fc0a5fc";
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
    ident = "monocle-ts";
    ldir  = "info/unscoped/m/monocle-ts";
    inherit packument fetchInfo;
  } // latest';

}

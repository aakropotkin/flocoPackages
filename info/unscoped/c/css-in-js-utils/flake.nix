{

  inputs.packument.url   = "https://registry.npmjs.org/css-in-js-utils?rev=15-e4c5dcfd6272f9a0c1b85b993371d638";
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
    ident = "css-in-js-utils";
    ldir  = "info/unscoped/c/css-in-js-utils";
    inherit packument fetchInfo;
  } // latest';

}

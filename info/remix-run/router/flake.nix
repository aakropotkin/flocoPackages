{

  inputs.packument.url   = "https://registry.npmjs.org/@remix-run/router?rev=19-12fd5abdeaf3ce2cf3cb13bad1413c3f";
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
    scope = "@remix-run";
    ident = "@remix-run/router";
    ldir  = "info/remix-run/router";
    inherit packument fetchInfo;
  } // latest';

}

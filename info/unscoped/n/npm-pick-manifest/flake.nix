{

  inputs.packument.url   = "https://registry.npmjs.org/npm-pick-manifest?rev=50-d4b3a520ef545ba7268c6d12ea463382";
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
    ident = "npm-pick-manifest";
    ldir  = "info/unscoped/n/npm-pick-manifest";
    inherit packument fetchInfo;
  } // latest';

}

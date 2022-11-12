{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-js?_rev=24-10cf9904caee1cf92b3727bf0f061bfb";
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
    ident = "postcss-js";
    ldir  = "info/unscoped/p/postcss-js";
    inherit packument fetchInfo;
  } // latest';

}

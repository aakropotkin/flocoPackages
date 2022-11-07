{

  inputs.packument.url   = "https://registry.npmjs.org/webpack-merge?rev=179-e35e753ee5f4f86fb2b049cc1c576aca";
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
    ident = "webpack-merge";
    ldir  = "info/unscoped/w/webpack-merge";
    inherit packument fetchInfo;
  } // latest';

}

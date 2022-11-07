{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-replace-object-assign?rev=8-ada804be18ee3b3f6609bc33e332d9d4";
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
    ident = "babel-plugin-transform-replace-object-assign";
    ldir  = "info/unscoped/b/babel-plugin-transform-replace-object-assign";
    inherit packument fetchInfo;
  } // latest';

}

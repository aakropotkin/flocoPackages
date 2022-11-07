{

  inputs.packument.url   = "https://registry.npmjs.org/fbjs-css-vars?rev=7-852491dd28d46d183230a3be3d0a7ee4";
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
    ident = "fbjs-css-vars";
    ldir  = "info/unscoped/f/fbjs-css-vars";
    inherit packument fetchInfo;
  } // latest';

}

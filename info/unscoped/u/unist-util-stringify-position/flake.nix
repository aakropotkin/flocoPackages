{

  inputs.packument.url   = "https://registry.npmjs.org/unist-util-stringify-position?rev=17-07fc821d763f827db63112351b238144";
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
    ident = "unist-util-stringify-position";
    ldir  = "info/unscoped/u/unist-util-stringify-position";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/parseurl?_rev=59-ac86aaa76845d1ba08c5457b8641d681";
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
    ident = "parseurl";
    ldir  = "info/unscoped/p/parseurl";
    inherit packument fetchInfo;
  } // latest';

}

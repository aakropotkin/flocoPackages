{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/highlight.js?_rev=314-c00ebbcf0528e17e6f30a3021daf88b9";
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
    ident = "highlight.js";
    ldir  = "info/unscoped/h/highlight.js";
    inherit packument fetchInfo;
  } // latest';

}

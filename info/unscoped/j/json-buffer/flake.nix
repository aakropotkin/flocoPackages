{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/json-buffer?_rev=37-735a8df6fc52e612495d8761f612aca9";
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
    ident = "json-buffer";
    ldir  = "info/unscoped/j/json-buffer";
    inherit packument fetchInfo;
  } // latest';

}

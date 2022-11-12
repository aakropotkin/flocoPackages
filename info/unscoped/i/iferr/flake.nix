{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/iferr?_rev=19-d87cfa6b1b72c3b6eec820cdb2722b82";
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
    ident = "iferr";
    ldir  = "info/unscoped/i/iferr";
    inherit packument fetchInfo;
  } // latest';

}

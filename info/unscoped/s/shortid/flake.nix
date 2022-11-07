{

  inputs.packument.url   = "https://registry.npmjs.org/shortid?rev=264-23ebe2a74a458d95061ee2bccd7bb906";
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
    ident = "shortid";
    ldir  = "info/unscoped/s/shortid";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

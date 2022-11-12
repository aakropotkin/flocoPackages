{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gcp-metadata?_rev=67-5057ef31ff5df10b4869db55eefcf528";
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
    ident = "gcp-metadata";
    ldir  = "info/unscoped/g/gcp-metadata";
    inherit packument fetchInfo;
  } // latest';

}

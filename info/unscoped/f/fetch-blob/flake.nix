{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fetch-blob?_rev=29-c4436dd91c7b116e54baf44643c05727";
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
    ident = "fetch-blob";
    ldir  = "info/unscoped/f/fetch-blob";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ssri?_rev=68-a70bae6a6549b2b3da2c029da6e56c26";
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
    ident = "ssri";
    ldir  = "info/unscoped/s/ssri";
    inherit packument fetchInfo;
  } // latest';

}

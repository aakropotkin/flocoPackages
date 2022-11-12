{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-progress?_rev=58-e5b2ceb8cb783585ad7bed43086c64fe";
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
    ident = "rc-progress";
    ldir  = "info/unscoped/r/rc-progress";
    inherit packument fetchInfo;
  } // latest';

}

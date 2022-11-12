{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-segmented?_rev=9-dd52a99632132231738915c07dae5a1a";
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
    ident = "rc-segmented";
    ldir  = "info/unscoped/r/rc-segmented";
    inherit packument fetchInfo;
  } // latest';

}

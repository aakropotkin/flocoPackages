{

  inputs.packument.url   = "https://registry.npmjs.org/pend?rev=20-a5a9d956cb4eae8e4eaadc8b2483ee2a";
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
    ident = "pend";
    ldir  = "info/unscoped/p/pend";
    inherit packument fetchInfo;
  } // latest';

}

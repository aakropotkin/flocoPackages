{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/matcher?_rev=25-af3e1799f10445a386c189e84133a21f";
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
    ident = "matcher";
    ldir  = "info/unscoped/m/matcher";
    inherit packument fetchInfo;
  } // latest';

}

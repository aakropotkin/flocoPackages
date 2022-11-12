{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-measure?_rev=76-a50ada58aefe9a125ca669dae8cfb96c";
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
    ident = "react-measure";
    ldir  = "info/unscoped/r/react-measure";
    inherit packument fetchInfo;
  } // latest';

}

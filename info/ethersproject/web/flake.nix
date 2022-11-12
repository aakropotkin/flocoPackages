{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject/web?_rev=58-bb62a269fa0c67a15426d13d14db2bff";
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
    scope = "@ethersproject";
    ident = "@ethersproject/web";
    ldir  = "info/ethersproject/web";
    inherit packument fetchInfo;
  } // latest';

}

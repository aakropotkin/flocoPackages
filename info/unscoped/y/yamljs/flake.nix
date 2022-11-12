{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/yamljs?_rev=112-c5fd2d17074c2f0bd6771127e116231f";
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
    ident = "yamljs";
    ldir  = "info/unscoped/y/yamljs";
    inherit packument fetchInfo;
  } // latest';

}

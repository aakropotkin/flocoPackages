{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cidr-regex?_rev=28-07afc39972c708c2eca0b8e41a054289";
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
    ident = "cidr-regex";
    ldir  = "info/unscoped/c/cidr-regex";
    inherit packument fetchInfo;
  } // latest';

}

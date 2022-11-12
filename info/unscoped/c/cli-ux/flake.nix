{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cli-ux?_rev=185-b28b8377bc1c0e8e1f46313402eed5c9";
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
    ident = "cli-ux";
    ldir  = "info/unscoped/c/cli-ux";
    inherit packument fetchInfo;
  } // latest';

}

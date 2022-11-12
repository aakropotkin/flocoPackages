{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/yn?_rev=23-7e2193b552aead047d5e43d2193716eb";
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
    ident = "yn";
    ldir  = "info/unscoped/y/yn";
    inherit packument fetchInfo;
  } // latest';

}

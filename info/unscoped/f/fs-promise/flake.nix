{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fs-promise?_rev=69-858e4eb4babcd480b32ca6188795780e";
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
    ident = "fs-promise";
    ldir  = "info/unscoped/f/fs-promise";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/v8?_rev=6-050a32a3b424a2027fbcca343c746079";
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
    ident = "v8";
    ldir  = "info/unscoped/v/v8";
    inherit packument fetchInfo;
  } // latest';

}

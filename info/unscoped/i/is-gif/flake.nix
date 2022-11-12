{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-gif?_rev=16-6adb4d5b6938a974be6c024e6b13cfb7";
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
    ident = "is-gif";
    ldir  = "info/unscoped/i/is-gif";
    inherit packument fetchInfo;
  } // latest';

}

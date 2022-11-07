{

  inputs.packument.url   = "https://registry.npmjs.org/jws?rev=56-beb065e4f7f3d9339db2e99324adf55a";
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
    ident = "jws";
    ldir  = "info/unscoped/j/jws";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/jest-config?rev=416-bbde32b39196e3c17c8dc08744e589d0";
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
    ident = "jest-config";
    ldir  = "info/unscoped/j/jest-config";
    inherit packument fetchInfo;
  } // latest';

}

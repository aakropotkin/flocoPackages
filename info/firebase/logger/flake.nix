{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/logger?rev=2496-8d9de60ef010450a4f1acb060cb92517";
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
    scope = "@firebase";
    ident = "@firebase/logger";
    ldir  = "info/firebase/logger";
    inherit packument fetchInfo;
  } // latest';

}

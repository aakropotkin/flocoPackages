{

  inputs.packument.url   = "https://registry.npmjs.org/jest-circus?rev=252-5b5705039eb818185bdd896d207277ab";
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
    ident = "jest-circus";
    ldir  = "info/unscoped/j/jest-circus";
    inherit packument fetchInfo;
  } // latest';

}

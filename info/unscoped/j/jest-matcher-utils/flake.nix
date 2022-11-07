{

  inputs.packument.url   = "https://registry.npmjs.org/jest-matcher-utils?rev=292-8fa34c7e47465dd587adec9c9f01cbb6";
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
    ident = "jest-matcher-utils";
    ldir  = "info/unscoped/j/jest-matcher-utils";
    inherit packument fetchInfo;
  } // latest';

}

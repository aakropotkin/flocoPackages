{

  inputs.packument.url   = "https://registry.npmjs.org/jest-diff?rev=299-aea2ebd73c1c0632a04e205439a61a21";
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
    ident = "jest-diff";
    ldir  = "info/unscoped/j/jest-diff";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

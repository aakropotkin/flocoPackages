{

  inputs.packument.url   = "https://registry.npmjs.org/require-in-the-middle?rev=27-df01354ca49ddec40d04be8a357ceca5";
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
    ident = "require-in-the-middle";
    ldir  = "info/unscoped/r/require-in-the-middle";
    inherit packument fetchInfo;
  } // latest';

}

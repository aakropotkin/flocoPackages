{

  inputs.packument.url   = "https://registry.npmjs.org/stylis?rev=172-f38a1f28e09bbff91bb9a644da3cb0c4";
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
    ident = "stylis";
    ldir  = "info/unscoped/s/stylis";
    inherit packument fetchInfo;
  } // latest';

}

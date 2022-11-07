{

  inputs.packument.url   = "https://registry.npmjs.org/croner?rev=150-116382ae482a6d35289c4f9b1da10c98";
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
    ident = "croner";
    ldir  = "info/unscoped/c/croner";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/change-case?rev=109-cb77d09d0409ab2417e195f08b5d9ab1";
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
    ident = "change-case";
    ldir  = "info/unscoped/c/change-case";
    inherit packument fetchInfo;
  } // latest';

}

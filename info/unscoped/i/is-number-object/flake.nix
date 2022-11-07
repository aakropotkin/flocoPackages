{

  inputs.packument.url   = "https://registry.npmjs.org/is-number-object?rev=18-89ae231ae20f3f6a92c5b6cd9d36a968";
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
    ident = "is-number-object";
    ldir  = "info/unscoped/i/is-number-object";
    inherit packument fetchInfo;
  } // latest';

}

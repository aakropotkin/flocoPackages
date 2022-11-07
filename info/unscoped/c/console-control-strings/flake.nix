{

  inputs.packument.url   = "https://registry.npmjs.org/console-control-strings?rev=5-8bbfd4a156c7643beb30c2fc4e1ecc23";
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
    ident = "console-control-strings";
    ldir  = "info/unscoped/c/console-control-strings";
    inherit packument fetchInfo;
  } // latest';

}

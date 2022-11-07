{

  inputs.packument.url   = "https://registry.npmjs.org/is-number-like?rev=12-17ce5521f8aa22d97abd2ea740571326";
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
    ident = "is-number-like";
    ldir  = "info/unscoped/i/is-number-like";
    inherit packument fetchInfo;
  } // latest';

}

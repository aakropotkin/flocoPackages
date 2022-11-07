{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-config-standard-jsx?rev=44-0e18fc52578ffaa63c83e78b5ef33586";
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
    ident = "eslint-config-standard-jsx";
    ldir  = "info/unscoped/e/eslint-config-standard-jsx";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/es5-ext?rev=124-689f17bc94e0a8b47263466ad4724529";
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
    ident = "es5-ext";
    ldir  = "info/unscoped/e/es5-ext";
    inherit packument fetchInfo;
  } // latest';

}

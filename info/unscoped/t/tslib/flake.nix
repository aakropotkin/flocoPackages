{

  inputs.packument.url   = "https://registry.npmjs.org/tslib?rev=78-cb398e6ce0b13d23a20af78cebd80bd9";
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
    ident = "tslib";
    ldir  = "info/unscoped/t/tslib";
    inherit packument fetchInfo;
  } // latest';

}

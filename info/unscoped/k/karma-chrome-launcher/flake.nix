{

  inputs.packument.url   = "https://registry.npmjs.org/karma-chrome-launcher?rev=71-6d6876f799aef42cf3b4aa1d450a1366";
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
    ident = "karma-chrome-launcher";
    ldir  = "info/unscoped/k/karma-chrome-launcher";
    inherit packument fetchInfo;
  } // latest';

}

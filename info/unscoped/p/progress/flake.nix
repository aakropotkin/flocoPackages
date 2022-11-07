{

  inputs.packument.url   = "https://registry.npmjs.org/progress?rev=192-4bfc2a54811c05c29fb4fa5a0ba4da71";
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
    ident = "progress";
    ldir  = "info/unscoped/p/progress";
    inherit packument fetchInfo;
  } // latest';

}

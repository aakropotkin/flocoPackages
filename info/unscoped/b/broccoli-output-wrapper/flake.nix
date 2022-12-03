{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-output-wrapper";
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
    ident = "broccoli-output-wrapper";
    ldir  = "info/unscoped/b/broccoli-output-wrapper";
    inherit packument fetchInfo;
  } // latest';

}

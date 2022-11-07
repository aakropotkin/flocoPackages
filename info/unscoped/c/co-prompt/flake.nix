{

  inputs.packument.url   = "https://registry.npmjs.org/co-prompt?rev=25-af1093be9666f01ba23f01ff021705f0";
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
    ident = "co-prompt";
    ldir  = "info/unscoped/c/co-prompt";
    inherit packument fetchInfo;
  } // latest';

}

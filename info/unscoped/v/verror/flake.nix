{

  inputs.packument.url   = "https://registry.npmjs.org/verror?rev=138-6d0133f5f08fa2368eb62d5092db79a8";
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
    ident = "verror";
    ldir  = "info/unscoped/v/verror";
    inherit packument fetchInfo;
  } // latest';

}

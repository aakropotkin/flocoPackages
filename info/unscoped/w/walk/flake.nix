{

  inputs.packument.url   = "https://registry.npmjs.org/walk?rev=112-0191e6f2a692fe10a70649f121d2d55c";
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
    ident = "walk";
    ldir  = "info/unscoped/w/walk";
    inherit packument fetchInfo;
  } // latest';

}

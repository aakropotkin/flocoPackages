{

  inputs.packument.url   = "https://registry.npmjs.org/package-hash?rev=11-bd7235ae5bec0cc26593788ae65cd692";
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
    ident = "package-hash";
    ldir  = "info/unscoped/p/package-hash";
    inherit packument fetchInfo;
  } // latest';

}

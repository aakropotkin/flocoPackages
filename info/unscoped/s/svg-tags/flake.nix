{

  inputs.packument.url   = "https://registry.npmjs.org/svg-tags?rev=7-86081ca829121c126db90c0b93a94c45";
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
    ident = "svg-tags";
    ldir  = "info/unscoped/s/svg-tags";
    inherit packument fetchInfo;
  } // latest';

}

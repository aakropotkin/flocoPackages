{

  inputs.packument.url   = "https://registry.npmjs.org/fuzzy?rev=40-aff3c43d30c15585dc625af31243d0c6";
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
    ident = "fuzzy";
    ldir  = "info/unscoped/f/fuzzy";
    inherit packument fetchInfo;
  } // latest';

}

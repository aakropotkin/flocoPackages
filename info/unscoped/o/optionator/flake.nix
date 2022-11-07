{

  inputs.packument.url   = "https://registry.npmjs.org/optionator?rev=40-2eba21d25775bf1c5618087ad8954d33";
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
    ident = "optionator";
    ldir  = "info/unscoped/o/optionator";
    inherit packument fetchInfo;
  } // latest';

}

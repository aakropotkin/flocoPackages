{

  inputs.packument.url   = "https://registry.npmjs.org/propagate?rev=25-f200e1c0dde202a7854304f01b0aab0c";
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
    ident = "propagate";
    ldir  = "info/unscoped/p/propagate";
    inherit packument fetchInfo;
  } // latest';

}

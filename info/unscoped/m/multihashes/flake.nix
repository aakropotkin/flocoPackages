{

  inputs.packument.url   = "https://registry.npmjs.org/multihashes?rev=71-a0c44be4f2fb22595089ab1e67880e4d";
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
    ident = "multihashes";
    ldir  = "info/unscoped/m/multihashes";
    inherit packument fetchInfo;
  } // latest';

}

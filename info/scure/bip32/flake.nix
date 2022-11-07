{

  inputs.packument.url   = "https://registry.npmjs.org/@scure/bip32?rev=6-f8aed83b17c630dff65d811c2de0368a";
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
    scope = "@scure";
    ident = "@scure/bip32";
    ldir  = "info/scure/bip32";
    inherit packument fetchInfo;
  } // latest';

}

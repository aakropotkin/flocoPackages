{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-message-helpers?_rev=12-4b10a2ac27fcf47da44d9a0dac150644";
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
    ident = "postcss-message-helpers";
    ldir  = "info/unscoped/p/postcss-message-helpers";
    inherit packument fetchInfo;
  } // latest';

}

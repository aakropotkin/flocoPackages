{

  inputs.packument.url   = "https://registry.npmjs.org/union?rev=75-1c777c620734f307d20f44e1a37f7970";
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
    ident = "union";
    ldir  = "info/unscoped/u/union";
    inherit packument fetchInfo;
  } // latest';

}

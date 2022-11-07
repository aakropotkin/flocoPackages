{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-core-commonmark?rev=11-8c2885b40e0314edd02771a7aa8aff9b";
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
    ident = "micromark-core-commonmark";
    ldir  = "info/unscoped/m/micromark-core-commonmark";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

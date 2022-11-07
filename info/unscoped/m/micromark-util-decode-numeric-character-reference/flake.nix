{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-util-decode-numeric-character-reference?rev=2-6496599e7a237e2d5214ca4ba95eb10e";
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
    ident = "micromark-util-decode-numeric-character-reference";
    ldir  = "info/unscoped/m/micromark-util-decode-numeric-character-reference";
    inherit packument fetchInfo;
  } // latest';

}

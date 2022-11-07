{

  inputs.packument.url   = "https://registry.npmjs.org/@emotion/hash?rev=20-bc4ab646a1c014b68de7a8e55dffcdb2";
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
    scope = "@emotion";
    ident = "@emotion/hash";
    ldir  = "info/emotion/hash";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/@emotion/stylis?rev=27-55e6c185b94225574148290559505c60";
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
    ident = "@emotion/stylis";
    ldir  = "info/emotion/stylis";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

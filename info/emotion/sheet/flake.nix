{

  inputs.packument.url   = "https://registry.npmjs.org/@emotion/sheet?rev=44-a2fe664b0272d8833f6ab5f6ad00d30e";
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
    ident = "@emotion/sheet";
    ldir  = "info/emotion/sheet";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

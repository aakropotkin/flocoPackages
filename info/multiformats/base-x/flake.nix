{

  inputs.packument.url   = "https://registry.npmjs.org/@multiformats/base-x?rev=8-3b8f593ab11aaeeaecb4df628e63d7ae";
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
    scope = "@multiformats";
    ident = "@multiformats/base-x";
    ldir  = "info/multiformats/base-x";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

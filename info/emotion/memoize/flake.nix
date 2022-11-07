{

  inputs.packument.url   = "https://registry.npmjs.org/@emotion/memoize?rev=23-19a9068aa4a4d2193146726e9a5a9a75";
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
    ident = "@emotion/memoize";
    ldir  = "info/emotion/memoize";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

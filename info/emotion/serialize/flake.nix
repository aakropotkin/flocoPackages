{

  inputs.packument.url   = "https://registry.npmjs.org/@emotion/serialize?rev=66-dede35c48a430b94c967cdb883e16b16";
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
    ident = "@emotion/serialize";
    ldir  = "info/emotion/serialize";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

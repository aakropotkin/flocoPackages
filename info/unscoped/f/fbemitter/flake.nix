{

  inputs.packument.url   = "https://registry.npmjs.org/fbemitter?rev=20-5a72894e124f8d6305c17d9562124c21";
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
    ident = "fbemitter";
    ldir  = "info/unscoped/f/fbemitter";
    inherit packument fetchInfo;
  } // latest';

}

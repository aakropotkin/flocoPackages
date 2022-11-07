{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-place?rev=19-4e906fe143063b105aaddc13db7b1847";
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
    ident = "postcss-place";
    ldir  = "info/unscoped/p/postcss-place";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

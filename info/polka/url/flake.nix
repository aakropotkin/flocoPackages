{

  inputs.packument.url   = "https://registry.npmjs.org/@polka/url?rev=15-12f63a38ee5af93054b9a272f670109d";
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
    scope = "@polka";
    ident = "@polka/url";
    ldir  = "info/polka/url";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

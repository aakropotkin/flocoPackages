{

  inputs.packument.url   = "https://registry.npmjs.org/cheerio?rev=876-454715f8ee743ed93a8ca88664ed7802";
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
    ident = "cheerio";
    ldir  = "info/unscoped/c/cheerio";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

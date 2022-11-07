{

  inputs.packument.url   = "https://registry.npmjs.org/cheerio-select?rev=25-d6017194a9f6b8826df44f31f386c60a";
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
    ident = "cheerio-select";
    ldir  = "info/unscoped/c/cheerio-select";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

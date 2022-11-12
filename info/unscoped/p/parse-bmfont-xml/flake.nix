{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/parse-bmfont-xml?_rev=17-632c0a222cc8af45fa080d7b8253092e";
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
    ident = "parse-bmfont-xml";
    ldir  = "info/unscoped/p/parse-bmfont-xml";
    inherit packument fetchInfo;
  } // latest';

}

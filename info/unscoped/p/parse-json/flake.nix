{

  inputs.packument.url   = "https://registry.npmjs.org/parse-json?rev=31-50d60c21668233d013370514498a9f8e";
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
    ident = "parse-json";
    ldir  = "info/unscoped/p/parse-json";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

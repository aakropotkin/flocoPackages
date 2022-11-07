{

  inputs.packument.url   = "https://registry.npmjs.org/parse-filepath?rev=37-74ce890bde75be25cff39a81955a7f53";
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
    ident = "parse-filepath";
    ldir  = "info/unscoped/p/parse-filepath";
    inherit packument fetchInfo;
  } // latest';

}

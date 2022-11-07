{

  inputs.packument.url   = "https://registry.npmjs.org/functions-have-names?rev=9-68788bb79747c76ce9ece6dc66a7be32";
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
    ident = "functions-have-names";
    ldir  = "info/unscoped/f/functions-have-names";
    inherit packument fetchInfo;
  } // latest';

}

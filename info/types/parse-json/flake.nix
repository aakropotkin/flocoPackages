{

  inputs.packument.url   = "https://registry.npmjs.org/@types/parse-json?rev=452-c48d62e285f02e50b775fbf25c11a94a";
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
    scope = "@types";
    ident = "@types/parse-json";
    ldir  = "info/types/parse-json";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

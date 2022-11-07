{

  inputs.packument.url   = "https://registry.npmjs.org/@types/json5?rev=521-af2173a8e971831f9461c25fd15afb05";
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
    ident = "@types/json5";
    ldir  = "info/types/json5";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

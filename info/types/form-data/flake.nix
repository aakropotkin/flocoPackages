{

  inputs.packument.url   = "https://registry.npmjs.org/@types/form-data?rev=233-cf98bb5e6d43e8b9c1b1b323c51eb95f";
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
    ident = "@types/form-data";
    ldir  = "info/types/form-data";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

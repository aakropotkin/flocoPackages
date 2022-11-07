{

  inputs.packument.url   = "https://registry.npmjs.org/@types/node?rev=9094-49083283668b9b21753837bc8b0f756b";
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
    ident = "@types/node";
    ldir  = "info/types/node";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

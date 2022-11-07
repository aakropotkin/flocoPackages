{

  inputs.packument.url   = "https://registry.npmjs.org/@types/mysql?rev=764-604ba71c98f7cf938ba38c8db7021656";
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
    ident = "@types/mysql";
    ldir  = "info/types/mysql";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/@types/mdast?rev=413-1c29360e7ec062a697b22f800251e6ad";
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
    ident = "@types/mdast";
    ldir  = "info/types/mdast";
    inherit packument fetchInfo;
  } // latest';

}

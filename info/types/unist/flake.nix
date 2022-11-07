{

  inputs.packument.url   = "https://registry.npmjs.org/@types/unist?rev=382-1d4c7c32f8436c366002a90ca76945f5";
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
    ident = "@types/unist";
    ldir  = "info/types/unist";
    inherit packument fetchInfo;
  } // latest';

}

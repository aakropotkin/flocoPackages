{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/character-parser?_rev=32-d0eb440ca7dd5517d546b1eb4eddfebe";
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
    ident = "character-parser";
    ldir  = "info/unscoped/c/character-parser";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/commands?rev=48-3634271c2823382aad99fcc82fa86175";
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
    scope = "@lumino";
    ident = "@lumino/commands";
    ldir  = "info/lumino/commands";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

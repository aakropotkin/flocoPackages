{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/polling?rev=44-44749894b2d400e57224b1950fa5de36";
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
    ident = "@lumino/polling";
    ldir  = "info/lumino/polling";
    inherit packument fetchInfo;
  } // latest';

}

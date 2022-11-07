{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/application?rev=67-58d6a7830ee7df5c2d4ceb86c9400e8c";
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
    ident = "@lumino/application";
    ldir  = "info/lumino/application";
    inherit packument fetchInfo;
  } // latest';

}

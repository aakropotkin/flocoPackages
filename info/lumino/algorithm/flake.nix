{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/algorithm?rev=39-16ae9c7cc515be274db8cf3747138ba8";
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
    ident = "@lumino/algorithm";
    ldir  = "info/lumino/algorithm";
    inherit packument fetchInfo;
  } // latest';

}

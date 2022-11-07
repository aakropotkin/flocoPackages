{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/widgets?rev=69-3acaf1aa71d3cdec7cf33060f1943dad";
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
    ident = "@lumino/widgets";
    ldir  = "info/lumino/widgets";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/rx?rev=300-40d41652cb4433bb4c160a811a7e511f";
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
    ident = "rx";
    ldir  = "info/unscoped/r/rx";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

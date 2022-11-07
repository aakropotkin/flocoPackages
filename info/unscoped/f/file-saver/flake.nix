{

  inputs.packument.url   = "https://registry.npmjs.org/file-saver?rev=58-c207efe21de8d3d98d51e0129b7c34c5";
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
    ident = "file-saver";
    ldir  = "info/unscoped/f/file-saver";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

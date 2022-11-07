{

  inputs.packument.url   = "https://registry.npmjs.org/recursive-readdir?rev=90-733975e3009429a9a9721b9e5bdb60cc";
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
    ident = "recursive-readdir";
    ldir  = "info/unscoped/r/recursive-readdir";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

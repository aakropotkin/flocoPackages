{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tty-browserify?_rev=46-df08c815a10e0161e3706f2db2a8a5ec";
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
    ident = "tty-browserify";
    ldir  = "info/unscoped/t/tty-browserify";
    inherit packument fetchInfo;
  } // latest';

}

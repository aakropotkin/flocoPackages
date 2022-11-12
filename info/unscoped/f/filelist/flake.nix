{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/filelist?_rev=17-0d5e5d43475466afb48ec65bb1b0d898";
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
    ident = "filelist";
    ldir  = "info/unscoped/f/filelist";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/fs-readdir-recursive";
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
    ident = "fs-readdir-recursive";
    ldir  = "info/unscoped/f/fs-readdir-recursive";
    inherit packument fetchInfo;
  } // latest';

}

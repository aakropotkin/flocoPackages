{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/foreground-child?_rev=32-5ac59222fb0dc717b7bec458e62bfd1b";
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
    ident = "foreground-child";
    ldir  = "info/unscoped/f/foreground-child";
    inherit packument fetchInfo;
  } // latest';

}

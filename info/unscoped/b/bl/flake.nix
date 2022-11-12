{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bl?_rev=152-653c414398fb2ec525d6f88d3a2c321b";
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
    ident = "bl";
    ldir  = "info/unscoped/b/bl";
    inherit packument fetchInfo;
  } // latest';

}

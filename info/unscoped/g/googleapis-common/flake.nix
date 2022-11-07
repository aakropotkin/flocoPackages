{

  inputs.packument.url   = "https://registry.npmjs.org/googleapis-common?rev=56-0a01bb90d33126fd2e5538d6a93082df";
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
    ident = "googleapis-common";
    ldir  = "info/unscoped/g/googleapis-common";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

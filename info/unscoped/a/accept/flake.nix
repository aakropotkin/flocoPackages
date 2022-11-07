{

  inputs.packument.url   = "https://registry.npmjs.org/accept?rev=106-7a1595de0ebeb72d9417185c04003213";
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
    ident = "accept";
    ldir  = "info/unscoped/a/accept";
    inherit packument fetchInfo;
  } // latest';

}

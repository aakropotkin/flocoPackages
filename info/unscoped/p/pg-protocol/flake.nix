{

  inputs.packument.url   = "https://registry.npmjs.org/pg-protocol?rev=9-ee4f2ef8b8e510f909717f7a80299317";
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
    ident = "pg-protocol";
    ldir  = "info/unscoped/p/pg-protocol";
    inherit packument fetchInfo;
  } // latest';

}

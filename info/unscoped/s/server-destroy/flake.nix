{

  inputs.packument.url   = "https://registry.npmjs.org/server-destroy?rev=8-b6ef4af49b48e5e5498faa15498e23ba";
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
    ident = "server-destroy";
    ldir  = "info/unscoped/s/server-destroy";
    inherit packument fetchInfo;
  } // latest';

}

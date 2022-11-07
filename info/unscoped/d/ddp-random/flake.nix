{

  inputs.packument.url   = "https://registry.npmjs.org/ddp-random?rev=4-5e2f968dba44e6465b293d6a05e629f6";
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
    ident = "ddp-random";
    ldir  = "info/unscoped/d/ddp-random";
    inherit packument fetchInfo;
  } // latest';

}

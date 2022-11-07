{

  inputs.packument.url   = "https://registry.npmjs.org/tryer?rev=4-9678a71645371332d9d08ee9226bbbd6";
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
    ident = "tryer";
    ldir  = "info/unscoped/t/tryer";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/less?rev=677-e284a321d450ffa91c23111dfadff912";
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
    ident = "less";
    ldir  = "info/unscoped/l/less";
    inherit packument fetchInfo;
  } // latest';

}

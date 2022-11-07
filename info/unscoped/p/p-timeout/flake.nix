{

  inputs.packument.url   = "https://registry.npmjs.org/p-timeout?rev=25-1f93692b70c15aaa7e14478fa4c50895";
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
    ident = "p-timeout";
    ldir  = "info/unscoped/p/p-timeout";
    inherit packument fetchInfo;
  } // latest';

}

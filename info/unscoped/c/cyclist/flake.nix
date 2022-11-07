{

  inputs.packument.url   = "https://registry.npmjs.org/cyclist?rev=15-795003eea7e5f2b26e2b4a8fa4a42cf9";
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
    ident = "cyclist";
    ldir  = "info/unscoped/c/cyclist";
    inherit packument fetchInfo;
  } // latest';

}

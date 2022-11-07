{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/middleware-host-header?rev=103-d9647b8569a7993fa78e837331a9a942";
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
    scope = "@aws-sdk";
    ident = "@aws-sdk/middleware-host-header";
    ldir  = "info/aws-sdk/middleware-host-header";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/@alifd/field?rev=57-8401a0db98730e69ae4312863c478f56";
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
    scope = "@alifd";
    ident = "@alifd/field";
    ldir  = "info/alifd/field";
    inherit packument fetchInfo;
  } // latest';

}

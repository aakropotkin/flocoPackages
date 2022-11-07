{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/helper-api-error?rev=43-1aae347fecd56d018bf31f078a40aa77";
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
    scope = "@webassemblyjs";
    ident = "@webassemblyjs/helper-api-error";
    ldir  = "info/webassemblyjs/helper-api-error";
    inherit packument fetchInfo;
  } // latest';

}

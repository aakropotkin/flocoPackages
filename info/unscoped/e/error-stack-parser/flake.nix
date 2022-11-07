{

  inputs.packument.url   = "https://registry.npmjs.org/error-stack-parser?rev=69-bb84dd7a6c73718d0e733ba7434007a3";
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
    ident = "error-stack-parser";
    ldir  = "info/unscoped/e/error-stack-parser";
    inherit packument fetchInfo;
  } // latest';

}

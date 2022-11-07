{

  inputs.packument.url   = "https://registry.npmjs.org/zod?rev=248-c971eba0d9a2e405fc211b8c1046e5fe";
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
    ident = "zod";
    ldir  = "info/unscoped/z/zod";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/response-iterator?rev=10-96115fe317f199073cb9d99dd33f76f3";
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
    ident = "response-iterator";
    ldir  = "info/unscoped/r/response-iterator";
    inherit packument fetchInfo;
  } // latest';

}
